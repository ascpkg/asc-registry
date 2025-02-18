# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/ptr_container
    REF boost-1.72.0
    SHA512 6b46f3a7f8a1291fb7fbc52915a34d33c411a0c2408a657658554bac73c8f1f538496d205ca34ef5f1919061676b8c3d43c06d63dfe71f34f72c1c6f1aa11f7d
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
