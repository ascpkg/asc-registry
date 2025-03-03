# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/detail
    REF boost-1.72.0
    SHA512 9c4541da0bb9eddad51a464dad76faf29a949657b5ae0ad003bffe4a936bf49c7fb9ee3266a51b7637343b64e446541d1359aa1d46734d07f14bd044021afcfa
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
