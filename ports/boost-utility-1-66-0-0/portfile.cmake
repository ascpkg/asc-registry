# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/utility
    REF boost-1.66.0
    SHA512 aa72e1d32bb1575e23ec8e1dc12421e56d114532a9e7b3ebf2edf6926c79d2e2eb3c5483f241bc014b65008a9d03fbeadc85a6f0cea9013ecea2b1c1e942ea59
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
