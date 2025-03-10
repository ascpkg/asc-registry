# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/core
    REF boost-1.68.0
    SHA512 3870a595e146172a9e126d0894b4809bc776d66490f3f77112ca34f2c5c559576c732e3dd381d9366b25e46ace6a548741875b9992949aafa7cb5d395e3c9c48
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
