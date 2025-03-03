# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/icl
    REF boost-1.70.0
    SHA512 440d2c657f0b3ff5c2755944e8eef0e068b16e84416fd7e3552dd976916b875a8cd73fae7ba205812593415a684d80791f86c7e262f3c5e3aa56711cff579722
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
