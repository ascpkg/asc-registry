# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/geometry
    REF boost-1.69.0
    SHA512 a79a377497bb8270282032e77c62ba3afb25c2201dfdb26de37373141e1a4fa4edb3da4b2de22a1fccb1cbcb52c164ce98c8bb2b30b097509a38e062df85d3d6
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
