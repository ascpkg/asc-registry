# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/signals2
    REF boost-1.69.0
    SHA512 96be2cce707e433dadfd23766870d0b01b67e0d156e4178022eedb29928844964c632eefe1da359266180ec7b7bf5f6083f30baa06eb4eb0092078366e9ac4cd
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})