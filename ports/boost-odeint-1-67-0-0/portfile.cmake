# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/odeint
    REF boost-1.67.0
    SHA512 9c18b9ec2f02c9b36afb06c80ad9e881ab7c41580c2fca5b5c5a62c0aa6e1c3e9bb72c8a28670749e3723ce4bce4397db45547ba4db76acd6088f07644cadaa0
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
