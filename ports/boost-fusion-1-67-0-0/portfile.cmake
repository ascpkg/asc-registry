# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/fusion
    REF boost-1.67.0
    SHA512 2ac1af4f1a9aa9b90fb7057a8133e668207225a46e23c5ec1e65020b8a63c6daeabbf799f0b7aa9946fc5f9dded1003e00c68645363fa9e15014f2af7ea1498b
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})