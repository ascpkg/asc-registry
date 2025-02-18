# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/assign
    REF boost-1.78.0
    SHA512 72cb3460624d3f4fa12859edc1086ed966ffb83be94dc22c257e088ba10c9686129baa410d7b524237794dd29c983d92c25f65fad6c7c84288275a4ca77b95e8
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
