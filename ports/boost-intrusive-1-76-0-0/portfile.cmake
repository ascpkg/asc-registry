# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/intrusive
    REF boost-1.76.0
    SHA512 272ad56917b9f54d1a4ff578ac690766a692932ca7226a496b9a161d399c9a2e00f762db21924d7de6a446757f1dc5723af5e977a62ccfe408e4422c80cf76a8
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
