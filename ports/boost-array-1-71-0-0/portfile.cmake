# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/array
    REF boost-1.71.0
    SHA512 6b4fca7c5fb6630daef7580d3f6e693e2c61d139ce50d940cbe250618793500701c0c96aa708dbd846b6b3bf21ef5b5125486143e9a113577023273e199195e0
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
