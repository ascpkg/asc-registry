# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/metaparse
    REF boost-1.70.0
    SHA512 dd8883843be1a6e3dc8368b13081fc3451de0ed85985cf752858d80aa62e0846b4687c16a6aa1b6dc1e5e30d0603168c48197f70f031cf21586ba729352f0f09
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
