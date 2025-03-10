get_filename_component(BOOST_BUILD_INSTALLED_DIR "${CMAKE_CURRENT_LIST_DIR}" DIRECTORY)
get_filename_component(BOOST_BUILD_INSTALLED_DIR "${BOOST_BUILD_INSTALLED_DIR}" DIRECTORY)

function(boost_modular_build)
    cmake_parse_arguments(_bm "" "SOURCE_PATH;BOOST_CMAKE_FRAGMENT" "" ${ARGN})

    if(NOT DEFINED _bm_SOURCE_PATH)
        message(FATAL_ERROR "SOURCE_PATH is a required argument to boost_modular_build.")
    endif()

    # Next CMake variables may be overridden in the file specified in ${_bm_BOOST_CMAKE_FRAGMENT}
    set(B2_REQUIREMENTS) # this variable is used in the Jamroot.jam

    if(DEFINED _bm_BOOST_CMAKE_FRAGMENT)
        message(STATUS "Including ${_bm_BOOST_CMAKE_FRAGMENT}")
        include(${_bm_BOOST_CMAKE_FRAGMENT})
    endif()

    set(BOOST_BUILD_PATH "${BOOST_BUILD_INSTALLED_DIR}/tools/boost-build")

    if(EXISTS "${BOOST_BUILD_PATH}/b2.exe")
        set(B2_EXE "${BOOST_BUILD_PATH}/b2.exe")
    elseif(EXISTS "${BOOST_BUILD_PATH}/b2")
        set(B2_EXE "${BOOST_BUILD_PATH}/b2")
    else()
        message(FATAL_ERROR "Could not find b2 in ${BOOST_BUILD_PATH}")
    endif()

    if(NOT VCPKG_CMAKE_SYSTEM_NAME OR VCPKG_CMAKE_SYSTEM_NAME STREQUAL "WindowsStore")
        set(BOOST_LIB_PREFIX)
	if(VCPKG_PLATFORM_TOOLSET MATCHES "v14.")
	    set(BOOST_LIB_RELEASE_SUFFIX -vc140-mt.lib)
	    set(BOOST_LIB_DEBUG_SUFFIX -vc140-mt-gd.lib)
	elseif(VCPKG_PLATFORM_TOOLSET MATCHES "v120")
	    set(BOOST_LIB_RELEASE_SUFFIX -vc120-mt.lib)
	    set(BOOST_LIB_DEBUG_SUFFIX -vc120-mt-gd.lib)
	endif()
    else()
        set(BOOST_LIB_PREFIX lib)
        if(VCPKG_LIBRARY_LINKAGE STREQUAL "static")
            set(BOOST_LIB_RELEASE_SUFFIX .a)
            set(BOOST_LIB_DEBUG_SUFFIX .a)
        elseif(VCPKG_CMAKE_SYSTEM_NAME STREQUAL "Darwin")
            set(BOOST_LIB_RELEASE_SUFFIX .dylib)
            set(BOOST_LIB_DEBUG_SUFFIX .dylib)
        elseif(VCPKG_CMAKE_SYSTEM_NAME STREQUAL "MinGW")
            set(BOOST_LIB_RELEASE_SUFFIX .dll.a)
            set(BOOST_LIB_DEBUG_SUFFIX .dll.a)
        else()
            set(BOOST_LIB_RELEASE_SUFFIX .so)
            set(BOOST_LIB_DEBUG_SUFFIX .so)
        endif()
    endif()

    set(_jamfile)
    if(EXISTS "${_bm_SOURCE_PATH}/build/Jamfile.v2")
        set(_jamfile "${_bm_SOURCE_PATH}/build/Jamfile.v2")
    elseif(EXISTS "${_bm_SOURCE_PATH}/build/Jamfile")
        set(_jamfile "${_bm_SOURCE_PATH}/build/Jamfile")
    endif()
    if(_jamfile)
        file(READ "${_jamfile}" _contents)
        string(REGEX REPLACE
            "\.\./\.\./([^/ ]+)/build//(boost_[^/ ]+)"
            "/boost/\\1//\\2"
            _contents
            "${_contents}"
        )
        string(REGEX REPLACE "/boost//([^/ ]+)" "/boost/\\1//boost_\\1" _contents "${_contents}")
        file(WRITE "${_jamfile}" "${_contents}")
    endif()

    configure_file(${BOOST_BUILD_INSTALLED_DIR}/share/boost-build/Jamroot.jam ${_bm_SOURCE_PATH}/Jamroot.jam @ONLY)

    set(configure_options)
    if(_bm_BOOST_CMAKE_FRAGMENT)
        list(APPEND configure_options "-DBOOST_CMAKE_FRAGMENT=${_bm_BOOST_CMAKE_FRAGMENT}")
    endif()

    vcpkg_cmake_configure(
        SOURCE_PATH ${BOOST_BUILD_INSTALLED_DIR}/share/boost-build
        GENERATOR Ninja
        OPTIONS
            "-DPORT=${PORT}"
            "-DFEATURES=${FEATURES}"
            "-DCURRENT_INSTALLED_DIR=${CURRENT_INSTALLED_DIR}"
            "-DB2_EXE=${B2_EXE}"
            "-DSOURCE_PATH=${_bm_SOURCE_PATH}"
            "-DBOOST_BUILD_PATH=${BOOST_BUILD_PATH}"
            "-DVCPKG_CRT_LINKAGE=${VCPKG_CRT_LINKAGE}"
            ${configure_options}
        MAYBE_UNUSED_VARIABLES
            FEATURES
    )

    vcpkg_cmake_install()

    vcpkg_copy_pdbs()

    file(GLOB INSTALLED_LIBS ${CURRENT_PACKAGES_DIR}/debug/lib/*.lib ${CURRENT_PACKAGES_DIR}/lib/*.lib)
    foreach(LIB IN LISTS INSTALLED_LIBS)
        get_filename_component(OLD_FILENAME ${LIB} NAME)
        get_filename_component(DIRECTORY_OF_LIB_FILE ${LIB} DIRECTORY)
        string(REPLACE "libboost_" "boost_" NEW_FILENAME ${OLD_FILENAME})
        string(REPLACE "-s-" "-" NEW_FILENAME ${NEW_FILENAME}) # For Release libs
        string(REPLACE "-vc141-" "-vc140-" NEW_FILENAME ${NEW_FILENAME}) # To merge VS2017 and VS2015 binaries
        string(REPLACE "-vc142-" "-vc140-" NEW_FILENAME ${NEW_FILENAME}) # To merge VS2019 and VS2015 binaries
        string(REPLACE "-vc143-" "-vc140-" NEW_FILENAME ${NEW_FILENAME}) # To merge VS2022 and VS2015 binaries
        string(REPLACE "-sgd-" "-gd-" NEW_FILENAME ${NEW_FILENAME}) # For Debug libs
        string(REPLACE "-sgyd-" "-gyd-" NEW_FILENAME ${NEW_FILENAME}) # For Debug libs
        string(REPLACE "-x32-" "-" NEW_FILENAME ${NEW_FILENAME}) # To enable CMake 3.10 and earlier to locate the binaries
        string(REPLACE "-x64-" "-" NEW_FILENAME ${NEW_FILENAME}) # To enable CMake 3.10 and earlier to locate the binaries
        string(REPLACE "-a32-" "-" NEW_FILENAME ${NEW_FILENAME}) # To enable CMake 3.10 and earlier to locate the binaries
        string(REPLACE "-a64-" "-" NEW_FILENAME ${NEW_FILENAME}) # To enable CMake 3.10 and earlier to locate the binaries
        string(REPLACE "-1_77" "" NEW_FILENAME ${NEW_FILENAME}) # To enable CMake > 3.10 to locate the binaries
        if("${DIRECTORY_OF_LIB_FILE}/${NEW_FILENAME}" STREQUAL "${DIRECTORY_OF_LIB_FILE}/${OLD_FILENAME}")
            # nothing to do
        elseif(EXISTS ${DIRECTORY_OF_LIB_FILE}/${NEW_FILENAME})
            file(REMOVE ${DIRECTORY_OF_LIB_FILE}/${OLD_FILENAME})
        else()
            file(RENAME ${DIRECTORY_OF_LIB_FILE}/${OLD_FILENAME} ${DIRECTORY_OF_LIB_FILE}/${NEW_FILENAME})
        endif()
    endforeach()

    # boost-regex[icu] and boost-locale[icu] generate has_icu.lib
    if(EXISTS "${CURRENT_PACKAGES_DIR}/debug/lib/has_icu.lib")
        file(REMOVE "${CURRENT_PACKAGES_DIR}/debug/lib/has_icu.lib")
    endif()
    if(EXISTS "${CURRENT_PACKAGES_DIR}/lib/has_icu.lib")
        file(REMOVE "${CURRENT_PACKAGES_DIR}/lib/has_icu.lib")
    endif()

    if(NOT EXISTS ${CURRENT_PACKAGES_DIR}/lib)
        message(FATAL_ERROR "No libraries were produced. This indicates a failure while building the boost library.")
    endif()

    configure_file(${BOOST_BUILD_INSTALLED_DIR}/share/boost-build/usage ${CURRENT_PACKAGES_DIR}/share/${PORT}/usage COPYONLY)
endfunction()
