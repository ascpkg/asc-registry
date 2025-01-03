# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/type_erasure
    REF boost-1.69.0
    SHA512 40445b1b5f3e3ce61c7d5d2bc0d5018b4ebe2ebbba4d05e941bfbc792a52b04f6dd0025b6502f105686dc55d74ccbc5f7ca61a96a36532ddb6879a9d8d2f6afd
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-build/boost-modular-build.cmake)
boost_modular_build(SOURCE_PATH ${SOURCE_PATH})
include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
