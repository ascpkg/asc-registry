# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/preprocessor
    REF boost-1.78.0
    SHA512 55bbc91f7745a66e1ac02e8cf151cd8e10c143f47fca3d8b65f2fb6caed232a6ed939b7344cffdc1d8ea49caa404d1043bde85efe9e0c17ee2c7cff055a9d657
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
