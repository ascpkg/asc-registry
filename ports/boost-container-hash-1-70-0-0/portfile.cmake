# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/container_hash
    REF boost-1.70.0
    SHA512 e08a01a0c4ede6b8e7be77c78e9a9c66680e7fc31ce64e3f43d2f535dfdcf6cce1d35cf7f0d120242bd749a7fd082d4b938c30e02438970be25613ee69b5baf1
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
