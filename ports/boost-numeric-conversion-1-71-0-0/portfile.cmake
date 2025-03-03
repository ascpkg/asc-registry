# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/numeric_conversion
    REF boost-1.71.0
    SHA512 1b0dec311341750a1a3d3e382735481e7f1a80eb0217d25f6d668743e516831a4d382c58e2b5b747c08bd835e002a273e31d166101378d47076361c3826386d6
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
