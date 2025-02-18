# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/dll
    REF boost-1.69.0
    SHA512 b2948d2e7dc7899533a4ee073d6386166ccaf2fcb40feaa2a98e86f453cd58d74d7e75100cb0e85064ef11fe7caf065e165344463cbe3631333b4c8a3c6a8f50
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
