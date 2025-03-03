# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/convert
    REF boost-1.73.0
    SHA512 e2237c6113fe1d81fda851ec82d16b1645f41cac32cfd09c1169517517dfa29b63e0dd85c1bd781718414ef80002c194db3fe6c71c8eda27d8161bbf8966badf
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
