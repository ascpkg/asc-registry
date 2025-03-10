# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/filesystem
    REF boost-1.66.0
    SHA512 16c6c692485e02515fc09da5672cad4eb3c313e3a9ed9854d52ad1ba97a38d7346e4d0cf70baacba8468628bc1348350404151c3ff8984397a819d2cde3e4974
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-build/boost-modular-build.cmake)
boost_modular_build(SOURCE_PATH ${SOURCE_PATH})
include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
