# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/compatibility
    REF boost-1.66.0
    SHA512 3f78455431974ca24fe48a6fce22eb9f374455560f2e9442c921e082e23ceb82b9ac2a443e6c4dbba2d24531dd0752ef854d3548340e3dba42b31aa795885fe3
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
