# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/foreach
    REF boost-1.67.0
    SHA512 67cce17f58564a1ab09f85f9da3c73135dab2171be9487723e69d1bf10cb1abef2aae3747d39ca605510505510943a114d7637d49dd5f3b097c191b4993052b5
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
