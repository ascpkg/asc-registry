include(vcpkg_common_functions)
set(SOURCE_PATH ${CURRENT_BUILDTREES_DIR}/src/boost_1_63_0)

vcpkg_download_distfile(ARCHIVE_FILE
    URLS "https://sourceforge.net/projects/boost/files/boost/1.63.0/boost_1_63_0.tar.bz2"
    FILENAME "boost_1_63_0.tar.bz2"
    SHA512 c915c5f5778dee49b8e9d0a40f37f90f56fb1fdb1d8ce92d97bf48bc7bc462212487badfe4bbe30b06196d1149cfb221da12ac54e97499b0d4cb6466813bb4ad
)
vcpkg_extract_source_archive(${ARCHIVE_FILE})

# apply boost range hotfix
vcpkg_download_distfile(DIFF
    URLS "https://github.com/boostorg/range/commit/e7ebe14707130cda7b72e0ae5e93b17157fdb6a2.diff"
    FILENAME "boost-range-has_range_iterator-hotfix_e7ebe14707130cda7b72e0ae5e93b17157fdb6a2.diff"
    SHA512 77dad42bfd9bbab2bbddf361d5b7ad3dd6f812f4294c6dd1a677bb4d0191a4fff43bca32fdd4fce05d428562abb6e38afd0fd33ca6a8b5f28481d70cd2f3dd67
)

# apply boost TLS fix for VS2017
vcpkg_download_distfile(TLS_DIFF
    URLS "https://github.com/boostorg/thread/commit/bd0379af57fa294df310221492da618844182658.diff"
    FILENAME "boost-thread-on_tls_callback-bd0379af57fa294df310221492da618844182658.diff"
    SHA512 29501de9da5d101c762c9617eb74f072ec47eb9ef0021f036545bc883cbeb09c24b2ba7f78c24fb1a5d6b1fb3d7ae1def05a75be8634fc32bde0dface571c0a8
)

FILE(READ "${DIFF}" content)
STRING(REGEX REPLACE "include/" "" content "${content}")
set(DIFF2 ${CURRENT_BUILDTREES_DIR}/src/boost-range-has_range_iterator-hotfix_e7ebe14707130cda7b72e0ae5e93b17157fdb6a2.diff.fixed)
FILE(WRITE ${DIFF2} "${content}")
vcpkg_apply_patches(SOURCE_PATH ${SOURCE_PATH} PATCHES ${DIFF2})

FILE(READ "${TLS_DIFF}" content)
STRING(REGEX REPLACE "src/win32/" "libs/thread/src/win32/" content "${content}")
set(TLS_DIFF2 ${CURRENT_BUILDTREES_DIR}/src/boost-thread-on_tls_callback-bd0379af57fa294df310221492da618844182658.diff.fixed)
FILE(WRITE ${TLS_DIFF2} "${content}")
vcpkg_apply_patches(SOURCE_PATH ${SOURCE_PATH} PATCHES ${TLS_DIFF2})

if(NOT EXISTS ${SOURCE_PATH}/b2.exe)
    message(STATUS "Bootstrapping")
    vcpkg_execute_required_process(
        COMMAND "${SOURCE_PATH}/bootstrap.bat"
        WORKING_DIRECTORY ${SOURCE_PATH}
        LOGNAME bootstrap
    )
endif()
message(STATUS "Bootstrapping done")

set(B2_OPTIONS
    -sZLIB_INCLUDE="${CURRENT_INSTALLED_DIR}\\include"
    -sBZIP2_INCLUDE="${CURRENT_INSTALLED_DIR}\\include"
    -j$ENV{NUMBER_OF_PROCESSORS}
    --debug-configuration
    --hash
    -q

    --without-python
    threading=multi
)

if (VCPKG_CRT_LINKAGE STREQUAL dynamic)
    list(APPEND B2_OPTIONS runtime-link=shared)
else()
    list(APPEND B2_OPTIONS runtime-link=static)
endif()

if (VCPKG_LIBRARY_LINKAGE STREQUAL dynamic)
    list(APPEND B2_OPTIONS link=shared)
else()
    list(APPEND B2_OPTIONS link=static)
endif()

if(TRIPLET_SYSTEM_ARCH MATCHES "x64")
    list(APPEND B2_OPTIONS address-model=64)
endif()

if(VCPKG_CMAKE_SYSTEM_NAME MATCHES "WindowsStore" AND VCPKG_PLATFORM_TOOLSET MATCHES "v141")
    message(WARNING "Combination of VS2017 and UWP is partially supported; using reference Winmd's from VS2015")
endif()
if(VCPKG_CMAKE_SYSTEM_NAME MATCHES "WindowsStore")
    list(APPEND B2_OPTIONS windows-api=store)
    set(ENV{BOOST_BUILD_PATH} ${CMAKE_CURRENT_LIST_DIR}/uwp)
else()
    set(ENV{BOOST_BUILD_PATH} ${CMAKE_CURRENT_LIST_DIR}/vs2017)
endif()

if(VCPKG_PLATFORM_TOOLSET MATCHES "v141")
    list(APPEND B2_OPTIONS toolset=msvc-14.1)
elseif(VCPKG_PLATFORM_TOOLSET MATCHES "v140")
    list(APPEND B2_OPTIONS toolset=msvc-14.0)
else()
    message(FATAL_ERROR "Unsupported value for VCPKG_PLATFORM_TOOLSET: '${VCPKG_PLATFORM_TOOLSET}'")
endif()

# Add build type specific options
set(B2_OPTIONS_DBG
    ${B2_OPTIONS}
    -sZLIB_BINARY=zlibd
    -sZLIB_LIBPATH="${CURRENT_INSTALLED_DIR}\\debug\\lib"
    -sBZIP2_BINARY=bz2
    -sBZIP2_LIBPATH="${CURRENT_INSTALLED_DIR}\\debug\\lib"
)

set(B2_OPTIONS_REL
    ${B2_OPTIONS}
    -sZLIB_BINARY=zlib
    -sZLIB_LIBPATH="${CURRENT_INSTALLED_DIR}\\lib"
    -sBZIP2_BINARY=bz2
    -sBZIP2_LIBPATH="${CURRENT_INSTALLED_DIR}\\lib"
)

file(REMOVE_RECURSE ${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-rel)
if(EXISTS ${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-rel)
    message(FATAL_ERROR "Unable to remove directory: ${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-rel\n  Files are likely in use.")
endif()

file(REMOVE_RECURSE ${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-dbg)
if(EXISTS ${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-dbg)
    message(FATAL_ERROR "Unable to remove directory: ${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-dbg\n  Files are likely in use.")
endif()

if(EXISTS ${CURRENT_PACKAGES_DIR}/debug)
    message(FATAL_ERROR "Error: directory exists: ${CURRENT_PACKAGES_DIR}/debug\n  The previous package was not fully cleared. This is an internal error.")
endif()

message(STATUS "Building ${TARGET_TRIPLET}-rel")
vcpkg_execute_required_process_repeat(
    COUNT 2
    COMMAND "${SOURCE_PATH}/b2.exe"
        --stagedir=${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-rel/stage
        --build-dir=${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-rel
        ${B2_OPTIONS_REL}
        variant=release
        debug-symbols=on
    WORKING_DIRECTORY ${SOURCE_PATH}
    LOGNAME build-${TARGET_TRIPLET}-rel
)
message(STATUS "Building ${TARGET_TRIPLET}-rel done")
message(STATUS "Building ${TARGET_TRIPLET}-dbg")
vcpkg_execute_required_process_repeat(
    COUNT 2
    COMMAND "${SOURCE_PATH}/b2.exe"
        --stagedir=${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-dbg/stage
        --build-dir=${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-dbg
        ${B2_OPTIONS_DBG}
        variant=debug
    WORKING_DIRECTORY ${SOURCE_PATH}
    LOGNAME build-${TARGET_TRIPLET}-dbg
)
message(STATUS "Building ${TARGET_TRIPLET}-dbg done")

message(STATUS "Packaging headers")
file(
    COPY ${SOURCE_PATH}/boost
    DESTINATION ${CURRENT_PACKAGES_DIR}/include
)

# Disable Boost auto-link.
file(APPEND ${CURRENT_PACKAGES_DIR}/include/boost/config/user.hpp
	"\n#define BOOST_ALL_NO_LIB\n"
)

if (VCPKG_LIBRARY_LINKAGE STREQUAL dynamic)
    file(APPEND ${CURRENT_PACKAGES_DIR}/include/boost/config/user.hpp
        "\n#define BOOST_ALL_DYN_LINK\n"
    )
endif()

file(INSTALL ${SOURCE_PATH}/LICENSE_1_0.txt DESTINATION ${CURRENT_PACKAGES_DIR}/share/boost RENAME copyright)
message(STATUS "Packaging headers done")

# This function makes the static build lib names match the dynamic build lib names which FindBoost.cmake is looking for by default.
# It also renames a couple of "libboost" lib files in the dynamic build (for example libboost_exception-vc140-mt-1_63.lib).
function(boost_rename_libs LIBS)
    foreach(LIB ${${LIBS}})
        get_filename_component(OLD_FILENAME ${LIB} NAME)
        get_filename_component(DIRECTORY_OF_LIB_FILE ${LIB} DIRECTORY)
        string(REPLACE "libboost_" "boost_" NEW_FILENAME ${OLD_FILENAME})
        string(REPLACE "-s-" "-" NEW_FILENAME ${NEW_FILENAME}) # For Release libs
        string(REPLACE "-vc141-" "-vc140-" NEW_FILENAME ${NEW_FILENAME}) # To merge VS2017 and VS2015 binaries
        string(REPLACE "-sgd-" "-gd-" NEW_FILENAME ${NEW_FILENAME}) # For Debug libs
        if ("${DIRECTORY_OF_LIB_FILE}/${NEW_FILENAME}" STREQUAL "${DIRECTORY_OF_LIB_FILE}/${OLD_FILENAME}")
            # nothing to do
        elseif (EXISTS ${DIRECTORY_OF_LIB_FILE}/${NEW_FILENAME})
            file(REMOVE ${DIRECTORY_OF_LIB_FILE}/${OLD_FILENAME})
        else()
            file(RENAME ${DIRECTORY_OF_LIB_FILE}/${OLD_FILENAME} ${DIRECTORY_OF_LIB_FILE}/${NEW_FILENAME})
        endif()
    endforeach()
endfunction()

message(STATUS "Packaging ${TARGET_TRIPLET}-rel")
file(INSTALL ${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-rel/stage/lib/
    DESTINATION ${CURRENT_PACKAGES_DIR}/lib
    FILES_MATCHING PATTERN "*.lib")
if (VCPKG_LIBRARY_LINKAGE STREQUAL dynamic)
    file(INSTALL ${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-rel/stage/lib/
        DESTINATION ${CURRENT_PACKAGES_DIR}/bin
        FILES_MATCHING PATTERN "*.dll")
endif()
file(GLOB RELEASE_LIBS ${CURRENT_PACKAGES_DIR}/lib/*.lib)
boost_rename_libs(RELEASE_LIBS)
message(STATUS "Packaging ${TARGET_TRIPLET}-rel done")

message(STATUS "Packaging ${TARGET_TRIPLET}-dbg")
file(INSTALL ${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-dbg/stage/lib/
    DESTINATION ${CURRENT_PACKAGES_DIR}/debug/lib
    FILES_MATCHING PATTERN "*.lib")
if (VCPKG_LIBRARY_LINKAGE STREQUAL dynamic)
    file(INSTALL ${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-dbg/stage/lib/
        DESTINATION ${CURRENT_PACKAGES_DIR}/debug/bin
        FILES_MATCHING PATTERN "*.dll")
endif()
file(GLOB DEBUG_LIBS ${CURRENT_PACKAGES_DIR}/debug/lib/*.lib)
boost_rename_libs(DEBUG_LIBS)
message(STATUS "Packaging ${TARGET_TRIPLET}-dbg done")

vcpkg_copy_pdbs()
