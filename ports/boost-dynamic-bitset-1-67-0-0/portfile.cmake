# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/dynamic_bitset
    REF boost-1.67.0
    SHA512 242c7f79a50c98357017bfd09a3d2b27b2a9f1f8e12518eb497bd684ac9cf2dd6afdffb417a135a3648e40f4efb10c0f45703cff302212b8bdcf35ab1428955f
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
