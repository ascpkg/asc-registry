# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/qvm
    REF boost-1.69.0
    SHA512 b801ce8f2e96364fbafa31d1a501706a81d57b7d6f2c0ce63c4ca103957f8a4504eb1797fa96e812dac032e4972b18bc973e8a4bc24cfb38ac3a367dad75b4f7
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
