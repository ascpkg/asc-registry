# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/proto
    REF boost-1.72.0
    SHA512 a725ad97f837758bc9ea2b7523f34074144c95d548eae330cd8eaa8f6b9eaa4c0107f65849f5af050f3005cc0ab1ea529c87b443c471b040ef9318e8597674bd
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
