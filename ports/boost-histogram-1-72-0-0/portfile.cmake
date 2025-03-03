# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/histogram
    REF boost-1.72.0
    SHA512 b33a8728012eaa98d9b7da9cfb20baecbdc53f08dad150a669ba3c94a13d08f3b5ffab803dd961124e7ed2c9d6c4de8ae3c71ef317fa97eb8a7383f76cf06d6a
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
