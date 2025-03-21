# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/bind
    REF boost-1.76.0
    SHA512 a2e40c56d5092818bcddd22b90c6fe6705e2d322b9d96e5abb3524fa166e1d7fc6e5a9c98acf14409663a639c77274d12f9e9840eaa4c963b872c7363caa54ba
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
