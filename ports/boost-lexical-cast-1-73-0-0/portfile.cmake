# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/lexical_cast
    REF boost-1.73.0
    SHA512 ea6e8f58f38b8e45171f85b7983257ae920bdc2d77a9e9f5c12fcc1e899ecefcaf98278183233262540704cdb4f036b1d4f1cff73c40c38e16a8498117e97b31
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
