# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/interprocess
    REF boost-1.66.0
    SHA512 e3c7f4fb49d126671354212fdb079c418847061a33589ab92c8cb600b469b98c658533307e1d0322c97568eb2716caccbf43b4b2d8eab520eab4d0f50b4df773
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
