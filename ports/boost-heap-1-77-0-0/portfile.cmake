# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/heap
    REF boost-1.77.0
    SHA512 73885784757bbec1ec5ac77fad398498f0f80f7d52b69f82b6d0c93d99cec38ec19765e20157fa6fee7e4fec371ce98962589ee2fc42b280dfe831ba56b0afef
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
