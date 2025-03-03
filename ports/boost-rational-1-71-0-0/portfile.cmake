# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/rational
    REF boost-1.71.0
    SHA512 9868f48e82c75cee6d70c40a0059fbe3fa650df188f143608f327ed1973b7522ae8b0f3113a782e11ead354fcd127d8a41a758ff6d56fa4e8459e79cbb979e1f
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
