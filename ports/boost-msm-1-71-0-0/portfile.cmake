# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/msm
    REF boost-1.71.0
    SHA512 0c8f993b49a7ace6e5ef0b64e155d2b87c38a6f6d19748175b10145573c035d95d4d6da71feffc4b85953ebe9c0d7332c269f6870b3af0e8e2af4f8ee6037e31
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
