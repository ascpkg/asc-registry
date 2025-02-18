# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/units
    REF boost-1.69.0
    SHA512 6a4a18e6dc8b2d8ddcd027bab0b30a6892639de6e85f25dd456b23fb36f162fd6ec142f49e7ab416bbd1e9d6f5eac541faaa46450896dbfa9691c31c855e217f
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
