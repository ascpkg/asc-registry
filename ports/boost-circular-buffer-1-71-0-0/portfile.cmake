# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/circular_buffer
    REF boost-1.71.0
    SHA512 c40fc12a371c92d3deb07558ed0a8e6e582ddd66beb7af711195da38efbee9fcfab65605290899c02725ab4ec1a1b5704bc79138fefcbcbd54dd968d1d085ade
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
