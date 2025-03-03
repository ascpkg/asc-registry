# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_buildpath_length_warning(37)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/system
    REF boost-1.74.0
    SHA512 681ad487a3b2ba0392ca1a86119e2be21c4c9f8b71e0a624d4939c92c00b94d1a491f14305176d3b8ea715568db084cbd1e3d3affe58d5c4b8177edb5945e785
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-build/boost-modular-build.cmake)
boost_modular_build(SOURCE_PATH ${SOURCE_PATH})
include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
