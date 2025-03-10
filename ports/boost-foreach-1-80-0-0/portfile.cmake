# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/foreach
    REF boost-1.80.0
    SHA512 4ce33f0b1157ee29c2bd2f9a68b2992b1839da220789b2146632f7a2a859bf756ac60ebf0ed7876c4d57c5a814f51561e3b13fafc58f80ac653b2d93b572abae
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
