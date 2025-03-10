# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/property_map
    REF boost-1.66.0
    SHA512 3a935f14bf87a8c469b39a9fc4457f11d932caede6558d49868073ad35113a6285c48fed4fe3f2e6c8d743f1cf28ac0e8c4bb83b230a55035a89a60e24d43441
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
