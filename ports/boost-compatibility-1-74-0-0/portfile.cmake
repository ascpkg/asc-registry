# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/compatibility
    REF boost-1.74.0
    SHA512 fcaefec8235c0f588ea1498f88cbe02c9e64439f1ce512faa5817c0be8fcd5723f25628f4717c2f3dfb93bc43766d7d1a6196c358ea080c484fdc73cd112c171
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
