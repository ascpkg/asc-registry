# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/mpl
    REF boost-1.67.0
    SHA512 90143065ae6a180dd542ad50ceb111d221b587e6e109707c3421582996f0918828f42df69d1e44071981996f30fe59e969efa2271a8b70e70a10516f9b83b1f4
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
