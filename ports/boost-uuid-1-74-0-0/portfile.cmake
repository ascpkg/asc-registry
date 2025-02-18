# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/uuid
    REF boost-1.74.0
    SHA512 773e2571f617324592778591c64e7d6e2be93d1ca178aff8c8ffe0a4b89a24f05af2dee99fe7931624f33e8bfbfacf32869a184d2e81a3e7224a8adde67f2b64
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
