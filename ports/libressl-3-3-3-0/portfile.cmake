if(EXISTS "${CURRENT_INSTALLED_DIR}/include/openssl/ssl.h")
  message(WARNING "Can't build libressl if openssl is installed. Please remove openssl, and try install libressl again if you need it. Build will continue since libressl is a subset of openssl")
  set(VCPKG_POLICY_EMPTY_PACKAGE enabled)
  return()
endif()

vcpkg_fail_port_install(ON_ARCH "arm" ON_TARGET "uwp")

set(LIBRESSL_VERSION 3.3.3)
set(LIBRESSL_HASH 2d0b5f4cfe37d573bc64d5967abb77f536dbe581fbad9637d925332bcdfd185fe6810335b2af80a89f92d7e6edaa8ea3ba2492c60a117e47ea1b2d6aacf01f0f)

vcpkg_download_distfile(
    LIBRESSL_SOURCE_ARCHIVE
    URLS https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/${PORT}-${LIBRESSL_VERSION}.tar.gz https://ftp.fau.de/openbsd/LibreSSL/${PORT}-${LIBRESSL_VERSION}.tar.gz
    FILENAME ${PORT}-${LIBRESSL_VERSION}.tar.gz
    SHA512 ${LIBRESSL_HASH}
)

vcpkg_extract_source_archive_ex(
    OUT_SOURCE_PATH SOURCE_PATH
    ARCHIVE "${LIBRESSL_SOURCE_ARCHIVE}"
    REF ${LIBRESSL_VERSION}
    PATCHES
        0001-enable-ocspcheck-on-msvc.patch
        0002-suppress-msvc-warnings.patch
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        "tools" LIBRESSL_APPS
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS
        ${FEATURE_OPTIONS}
        -DLIBRESSL_TESTS=OFF
    OPTIONS_DEBUG
        -DLIBRESSL_APPS=OFF
)

vcpkg_install_cmake()

if("tools" IN_LIST FEATURES)
    if(VCPKG_TARGET_IS_WINDOWS OR VCPKG_TARGET_IS_UWP)
        set(EXECUTABLE_SUFFIX .exe)
    endif()
    file(MAKE_DIRECTORY "${CURRENT_PACKAGES_DIR}/tools/openssl")
    file(RENAME "${CURRENT_PACKAGES_DIR}/bin/openssl${EXECUTABLE_SUFFIX}" "${CURRENT_PACKAGES_DIR}/tools/openssl/openssl${EXECUTABLE_SUFFIX}")
    file(RENAME "${CURRENT_PACKAGES_DIR}/bin/ocspcheck${EXECUTABLE_SUFFIX}" "${CURRENT_PACKAGES_DIR}/tools/openssl/ocspcheck${EXECUTABLE_SUFFIX}")
    vcpkg_copy_tool_dependencies("${CURRENT_PACKAGES_DIR}/tools/openssl")
endif()

if(VCPKG_LIBRARY_LINKAGE STREQUAL "static")
    file(REMOVE_RECURSE
        "${CURRENT_PACKAGES_DIR}/bin"
        "${CURRENT_PACKAGES_DIR}/debug/bin"
    )
endif()
file(REMOVE_RECURSE
    "${CURRENT_PACKAGES_DIR}/etc/ssl/certs"
    "${CURRENT_PACKAGES_DIR}/debug/etc/ssl/certs"
    "${CURRENT_PACKAGES_DIR}/share/man"
    "${CURRENT_PACKAGES_DIR}/debug/include"
    "${CURRENT_PACKAGES_DIR}/debug/share"
)

vcpkg_copy_pdbs()

file(INSTALL "${SOURCE_PATH}/COPYING" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)

if(VCPKG_TARGET_IS_WINDOWS OR VCPKG_TARGET_IS_UWP)
    file(GLOB_RECURSE LIBS "${CURRENT_PACKAGES_DIR}/*.lib")
    foreach(LIB ${LIBS})
        string(REGEX REPLACE "(.+)-[0-9]+\\.lib" "\\1.lib" LINK "${LIB}")
        execute_process(COMMAND "${CMAKE_COMMAND}" -E create_symlink "${LIB}" "${LINK}")
    endforeach()
endif()
