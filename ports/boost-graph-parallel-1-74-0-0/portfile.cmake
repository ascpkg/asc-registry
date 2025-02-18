# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/graph_parallel
    REF boost-1.74.0
    SHA512 4a66e4ab4f09d47dc1b0a5607cf88b2afa9a0e673beab2c65f7f5d02675e6e146c6e8a4f93037f1a83469549250390202cfcda926a9cdf04fc1cca1701e4859a
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
