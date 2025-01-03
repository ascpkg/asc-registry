# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/convert
    REF boost-1.66.0
    SHA512 5edd73c5f78471a567f03e7772834656295acd6897f4674950a5064053d1c8de019050141d5109cc2bba13a94d2a06e2c7020d09af9eb78174f5bf8dc2ba2220
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
