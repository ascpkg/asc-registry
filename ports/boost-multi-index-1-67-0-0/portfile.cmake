# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/multi_index
    REF boost-1.67.0
    SHA512 6630d086a99b5e36d344643030a1639ab1d9393ccc93b112d56cb6c674e97f67b4a9245e51d0b43416274f50d2af094551c814822c9b17abc19b52227042ad91
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})