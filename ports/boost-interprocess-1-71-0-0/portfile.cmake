# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/interprocess
    REF boost-1.71.0
    SHA512 77eb6c9a04708655fc80e40492c40b1608e61e10f37b2bb66bbe69603bc38fc9588659a3980ee7d6b954e13d7216960df81304675573c7561eded1e5c06f547d
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
