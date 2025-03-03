# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/assert
    REF boost-1.76.0
    SHA512 bcd8d1fea358916d4ac8a707edee13bdc4b269a05f1456c3780fa525a2fe1438e8af1ca8689171da8bb3bb7ea2b02f0ed10ddc1204a5b52a885e2eebd1ba4f23
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
