# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/array
    REF boost-1.78.0
    SHA512 1d07d224f3e0fd4a2d5beb4704d102a64e4f4f95bd6fb218c5b63b28acba8e5b3cac140505df94dab9082a0eae70e11821d827b2c586e6203562262dd9b8a1f2
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
