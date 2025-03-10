# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/coroutine2
    REF boost-1.77.0
    SHA512 6e44ff880f2eca082e9f95bc5ecd79b4e17ddf22351a8d6ec3c20ca4eb967c23581e861d81c5516b8b88a4b6ad854dbb3cfe5af80f892d71eaef11d0a1558bfd
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
