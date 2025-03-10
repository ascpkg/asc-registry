# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/integer
    REF boost-1.76.0
    SHA512 d0df93ba10d4c6004c4b23aca512e3346c40cf6684d53059090b79dfcc633e89449beeae3b2f8f4e0c721076b55f92159dd5c6a7665405e426c66251ea2913a8
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
