# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/preprocessor
    REF boost-1.73.0
    SHA512 80341ca2dd62b0fda2f89609f062d9a93b6865c25d86f8f30c8f49848d8ce563b92c2d424e5181994b32603111a06869367a801fca29dea3f5bc6c6ed2fedf2b
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
