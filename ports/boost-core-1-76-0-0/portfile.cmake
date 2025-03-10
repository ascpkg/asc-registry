# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/core
    REF boost-1.76.0
    SHA512 95fc5db2580ebd4d8de1a377c7b006e3f89e99c3613620334caa2747b82e28356bb8e023a79f53fca9425a6a9aa9af28b53eefc2cb7222f0f5c5447f448c0143
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
