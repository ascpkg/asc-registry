# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/serialization
    REF boost-1.67.0
    SHA512 719b69945ebdf9eca9849c74bfab38ce1e2c8b4a11ea7cdf98c3da6250887f1712c841b18e428c5bac421b007e3bd0efce9b2c12893395982df98826621dc3bc
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-build/boost-modular-build.cmake)
boost_modular_build(SOURCE_PATH ${SOURCE_PATH})
include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})