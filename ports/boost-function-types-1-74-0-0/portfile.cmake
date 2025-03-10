# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/function_types
    REF boost-1.74.0
    SHA512 684887b5e2f6dc957a0f157596ac1d964d956ce0b9fab1b75c334848e9b5b5b2e2ccc486cdace5bcc453eb203cb5645d8413d7f21cadb36401798fd8e8c610ee
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
