# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/endian
    REF boost-1.71.0
    SHA512 8010633daa48982661e6d0f2e68796a60d6cd7c5d518689f41e22bdec8cca4609313bad42bb0a1efa3d5ba2d4f4c577cb9723f872d67627a3cf22ef78a8b18f8
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
