# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/function_types
    REF boost-1.76.0
    SHA512 d95ffacc507baf0bedb495f1ea7e0639a19db45b1d55f212dee1eea1e0a9de932e4b74da623200666eef5ead3aea60b66bf7f73cda845b95e54d26714dcdc2e6
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
