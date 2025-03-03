# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/conversion
    REF boost-1.72.0
    SHA512 bef4ca0c37f3f259bab9e280fea685898299c37fcd0bc198549c0524612be5d8100a0a5d7799fbd44ad68c4d82682c5970ce700b65294908fd78784e5f96e865
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
