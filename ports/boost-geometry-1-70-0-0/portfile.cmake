# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/geometry
    REF boost-1.70.0
    SHA512 78fd4f1f6f5956872c89f9b2d4cf20f7531ea55e50ad2dc33ee518e0f24a2e9a12e525ebbbb18ee884756e25cebb19307f199ddf1318dd4a07655e46e15d68dc
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
