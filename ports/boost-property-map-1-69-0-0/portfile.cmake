# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/property_map
    REF boost-1.69.0
    SHA512 6712f57133e12db2e094dae1895fedc995168c54b74052c02355f13164ea71ab393dbac1fe5f8236188a3282a30a91c39ee5dde4328b4e986f06da4bb3d0f033
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})