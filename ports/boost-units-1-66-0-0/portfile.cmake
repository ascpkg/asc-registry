# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/units
    REF boost-1.66.0
    SHA512 493c91b8741788c18147b0689df82e8391992797420f09fa3d90f8405c1ac7cab6a17c39231836d4410525eae3ae53899157cd48e28e3136ffc16970fc5209f6
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
