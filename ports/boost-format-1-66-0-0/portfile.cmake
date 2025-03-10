# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/format
    REF boost-1.66.0
    SHA512 f730b56c3c56e85d5f467b7c9b60b29b112990ac29ecfbd6cdcd41ac6c931b71067a88d35ba688c8b80b9f4636a5f6010448f470cd3c0c7cad7c8c1d933c1a67
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
