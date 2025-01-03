# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/callable_traits
    REF boost-1.66.0
    SHA512 87a0f4de9a8cf2652addca6b3b685cea242bf55e1609409f41360813761ad3078b414761cf34856223fe60f460616e13e7b2e6017afc3d053879c7ec8292b9b0
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
