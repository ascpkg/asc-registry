# Common Ambient Variables:
#   VCPKG_ROOT_DIR = <C:\path\to\current\vcpkg>
#   TARGET_TRIPLET is the current triplet (x86-windows, etc)
#   PORT is the current port name (zlib, etc)
#   CURRENT_BUILDTREES_DIR = ${VCPKG_ROOT_DIR}\buildtrees\${PORT}
#   CURRENT_PACKAGES_DIR  = ${VCPKG_ROOT_DIR}\packages\${PORT}_${TARGET_TRIPLET}
#

include(${CMAKE_TRIPLET_FILE})

if (VCPKG_LIBRARY_LINKAGE STREQUAL static)
    message(FATAL_ERROR "Static building not supported yet")
endif()

if (TARGET_TRIPLET MATCHES "arm-uwp")
    set(UWP_PLATFORM  "arm")
elseif (TARGET_TRIPLET MATCHES "x64-uwp")
    set(UWP_PLATFORM  "x64")
elseif (TARGET_TRIPLET MATCHES "x86-uwp")
    set(UWP_PLATFORM  "Win32")
else ()
    message(FATAL_ERROR "Only UWP DLL builds are supported at the moment")
endif()

include(vcpkg_common_functions)

set(SOURCE_PATH ${CURRENT_BUILDTREES_DIR}/src/openssl-OpenSSL_1_0_2_WinRT-stable)

vcpkg_find_acquire_program(PERL)
get_filename_component(PERL_EXE_PATH ${PERL} DIRECTORY)
set(ENV{PATH} "${PERL_EXE_PATH};$ENV{PATH}")

vcpkg_download_distfile(ARCHIVE
    URLS "https://github.com/Microsoft/openssl/archive/OpenSSL_1_0_2_WinRT-stable.zip"
    FILENAME "openssl-microsoft-1.0.2.zip"
    SHA512 f265b7dbeca6b86815dbc14af9f2b6688407efd921eb335b1acf5a642dddb6b6334a794fe0939666d9db66976db11a67ad78a3ed74484708d3bf2040aae598d2
)

vcpkg_extract_source_archive(${ARCHIVE})

# file(REMOVE_RECURSE ${SOURCE_PATH}/tmp32dll)
# file(REMOVE_RECURSE ${SOURCE_PATH}/out32dll)
# file(REMOVE_RECURSE ${SOURCE_PATH}/inc32dll)

file(COPY
${CMAKE_CURRENT_LIST_DIR}/setVSvars.bat
DESTINATION ${SOURCE_PATH}/ms)

file(COPY
${CMAKE_CURRENT_LIST_DIR}/make-openssl.bat
DESTINATION ${SOURCE_PATH})

message(STATUS "Build ${TARGET_TRIPLET}")

vcpkg_execute_required_process(
	COMMAND ${SOURCE_PATH}/make-openssl.bat ${UWP_PLATFORM}
    WORKING_DIRECTORY ${SOURCE_PATH}
    LOGNAME make-openssl-${TARGET_TRIPLET}
)


message(STATUS "Build ${TARGET_TRIPLET} done")



file(
    COPY ${SOURCE_PATH}/inc32/openssl
    DESTINATION ${CURRENT_PACKAGES_DIR}/include
)

file(INSTALL ${SOURCE_PATH}/out32dll/libeay32.dll
    DESTINATION ${CURRENT_PACKAGES_DIR}/bin)

file(INSTALL ${SOURCE_PATH}/out32dll/libeay32.pdb
    DESTINATION ${CURRENT_PACKAGES_DIR}/bin)

file(INSTALL ${SOURCE_PATH}/out32dll/libeay32.lib
    DESTINATION ${CURRENT_PACKAGES_DIR}/lib)

file(INSTALL ${SOURCE_PATH}/out32dll/ssleay32.dll
    DESTINATION ${CURRENT_PACKAGES_DIR}/bin)

file(INSTALL ${SOURCE_PATH}/out32dll/ssleay32.pdb
    DESTINATION ${CURRENT_PACKAGES_DIR}/bin)

file(INSTALL ${SOURCE_PATH}/out32dll/ssleay32.lib
    DESTINATION ${CURRENT_PACKAGES_DIR}/lib)



file(INSTALL ${SOURCE_PATH}/out32dll/libeay32.dll
    DESTINATION ${CURRENT_PACKAGES_DIR}/debug/bin)

file(INSTALL ${SOURCE_PATH}/out32dll/libeay32.pdb
    DESTINATION ${CURRENT_PACKAGES_DIR}/debug/bin)

file(INSTALL ${SOURCE_PATH}/out32dll/libeay32.lib
    DESTINATION ${CURRENT_PACKAGES_DIR}/debug/lib)

file(INSTALL ${SOURCE_PATH}/out32dll/ssleay32.dll
    DESTINATION ${CURRENT_PACKAGES_DIR}/debug/bin)

file(INSTALL ${SOURCE_PATH}/out32dll/ssleay32.pdb
    DESTINATION ${CURRENT_PACKAGES_DIR}/debug/bin)

file(INSTALL ${SOURCE_PATH}/out32dll/ssleay32.lib
    DESTINATION ${CURRENT_PACKAGES_DIR}/debug/lib)



file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/openssl-microsoft RENAME copyright)
