# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/iterator
    REF boost-1.76.0
    SHA512 0c890932dc16d87e350f3cfa0942aa92e9a590174d6f330259fe0b1eb2ead9ca3f1d0e0c2bb56e086e5eda9f2122e2eda2b67b52a4df8e614876a64ab014a300
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
