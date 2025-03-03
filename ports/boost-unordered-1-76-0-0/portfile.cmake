# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/unordered
    REF boost-1.76.0
    SHA512 77047942a8561c84a196606fc4d6964687f52c7da52b419e69cc0f73a8751ba937393ff25e2a7d3fa9f0487df1c78f34cd633c9440a1b2c47da53cfe66d5b526
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
