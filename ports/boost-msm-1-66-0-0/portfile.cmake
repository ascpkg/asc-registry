# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/msm
    REF boost-1.66.0
    SHA512 722360bb58971b52ca2078f908d439544d577fbcba0a99328a000be59772e492c5243192641cc91fe6b3ed95885b209a30f47fd1dd7246889b0552cdc1246b3d
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
