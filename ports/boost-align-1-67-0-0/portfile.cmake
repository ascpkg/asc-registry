# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/align
    REF boost-1.67.0
    SHA512 4dfbe372e977787067b7d270bd54f66919e48620300552f76ec3075e02e4514214d3bd8b5ff83599b7f277a8cafa95e550620231bfe366f38aa26ee51c6ef942
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})