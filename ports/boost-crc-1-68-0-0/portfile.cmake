# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/crc
    REF boost-1.68.0
    SHA512 8d29e20bae0b86bb7592b08a25d0a5c2b8ff83c1ee5aeef1cb9f1b97fe798f743b4ad6c3f1dc59fec54761b2440fc6c8cdfe6f7f4eb7c7352a3ff90c383abf87
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
