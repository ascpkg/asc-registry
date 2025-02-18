# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/proto
    REF boost-1.68.0
    SHA512 af03f0ad4d67d7d029fc9afec830e78295d34f0dd7af8dea57c3d931d042645f8a8458f1234112826072fb2eb9507ef39375ec412072b2be618621cec2934635
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
