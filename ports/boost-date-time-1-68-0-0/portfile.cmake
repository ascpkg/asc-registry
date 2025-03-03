# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/date_time
    REF boost-1.68.0
    SHA512 c48d488cf72bc2a7e10e6068fe1b541718bf1f402ec20bbae56da4b0f712804e21ed7613dbcd5fcc6f90adc59d867bb88c4ddd35d3200e50d291ec9d213660f3
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-build/boost-modular-build.cmake)
boost_modular_build(SOURCE_PATH ${SOURCE_PATH})
include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
