# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/gil
    REF boost-1.71.0
    SHA512 fc0cc2b4afec5cd24fe9ef4da56da7901735165240b5ed6edb6d03bd095502964829e9f774151fbb04d2dabd7a46660b04ada26a3be299a16e616a62a355e4cf
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
