# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/dll
    REF boost-1.70.0
    SHA512 607bcbb31cc4f630bd921a62dd57c35ace268f8eb048bc4460fde85cd399c04bc2f6880a3e868b5a5e24de91a3db04066b89e952740b1d9b2e4f4704555f8226
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
