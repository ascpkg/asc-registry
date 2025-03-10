# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/ublas
    REF boost-1.69.0
    SHA512 ef39748840ebdb19dfab07f51120c771e08d82edcd526952d15db105b3779c17a8c6742c73a55b0427ad84b7dfa30d08337f331d915fed09b0de30b3606c2385
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
