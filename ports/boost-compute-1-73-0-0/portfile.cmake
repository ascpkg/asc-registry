# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/compute
    REF boost-1.73.0
    SHA512 c6877630ce15dfa56f71d784e10264e24f0029ed28345ed6d1421b13e5c020511251129990f4a368dcaad9765936cab6d4364556e826335ac64788c3d87951dd
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
