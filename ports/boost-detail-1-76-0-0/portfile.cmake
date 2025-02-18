# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/detail
    REF boost-1.76.0
    SHA512 c1958a1ef6ab2fd9fbf2a16d6a0a4a8e49237e66b36c1f8f515d4c84386c1e98bac6d519f1395628441b9a7cdf01b479ebd28dd203835992e99f614dee5b609b
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
