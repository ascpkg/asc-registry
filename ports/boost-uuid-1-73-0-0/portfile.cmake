# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/uuid
    REF boost-1.73.0
    SHA512 68e4cb97d3e4080a6f1e72c91b823f423c9f4119bd2570086dcd14b723ea8500a8a2872d6ba4adf7a8a1119c6ac1f15dabd35795c00ba736cfb13933df75bd0a
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
