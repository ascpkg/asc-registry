# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/function_types
    REF boost-1.78.0
    SHA512 9cd5a8c91e3fa32e3d5aed48da82c5b22c4a3309eecb18adf07e716393e58bd61ae273a5077222ad4c036561b317591934c876392effeb47b231554a20ff291b
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
