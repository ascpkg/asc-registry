# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/signals2
    REF boost-1.72.0
    SHA512 11305c225d184f1b3da1530c06493c2a65362f26c35938cbc3f6685500e7ee9c1abfcab4f5de161b33900e3bc102300d1fb80c2e68dac69b10fdcd25b3742124
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
