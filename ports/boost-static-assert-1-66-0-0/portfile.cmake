# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/static_assert
    REF boost-1.66.0
    SHA512 97e0007ffef86578f4877744947e4c7d90de932719df25a38a72c018112b9b6d6d2fbdbef9307c02d1d85e5d8733a0f20a903c0fc623ef969afc788cfdf8722b
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
