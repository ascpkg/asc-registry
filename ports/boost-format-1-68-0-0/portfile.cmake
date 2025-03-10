# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/format
    REF boost-1.68.0
    SHA512 556acda0d0c7f7dc16cb83d0184aaa14dd0b1978f09c52dacc02a3e86d5d39a18e58d46818a18be36f781177538aa927c74cc48cc7bf5647aafc0ff1d4097d56
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
