# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/property_map
    REF boost-1.74.0
    SHA512 41519d8a48529a585ee9612a4ffd9c81db905267523b8b95534fb3204e27f6c6673a6f6abb50cb748994782228caac30c55e3245465a0925827169c81bfb65de
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
