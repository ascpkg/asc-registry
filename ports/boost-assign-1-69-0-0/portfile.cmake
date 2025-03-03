# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/assign
    REF boost-1.69.0
    SHA512 c83961ff2281421001a041a77ab785f81fba1b3538fc96a2b8a5ea6ca950e9088ed820d46758cf4d076c0f31b6b92d948a39384f7e2f796659a76434e7b089b9
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
