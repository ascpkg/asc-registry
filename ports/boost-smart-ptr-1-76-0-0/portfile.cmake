# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/smart_ptr
    REF boost-1.76.0
    SHA512 e6ac81d1da13daf080d67f046fae19e98ef4f1eeb17b65743b8ff52e4a28b15152b6fdf083662f9a2555694a93064f78fd0ec432bfe09d617d13fa7422e7f28b
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
