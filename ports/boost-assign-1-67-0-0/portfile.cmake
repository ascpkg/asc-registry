# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/assign
    REF boost-1.67.0
    SHA512 e7fd39fc4bcf7cc97c3f987a2cc7434c51d23fe47dbd480ac9203209c61db0883b479582adcfdef22b9f007df3467b43da72bef8b186ea8c5883a85013394dd2
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
