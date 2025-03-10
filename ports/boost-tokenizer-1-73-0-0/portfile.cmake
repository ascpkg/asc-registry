# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/tokenizer
    REF boost-1.73.0
    SHA512 cef77b4fb338dfefac3dc0f7eeef99acc07dc7ae66795697f10b8ad595bec93ad5f3f0fe0c802651415ae2620856f6e3bbf1b0ed28dac9baa7685c2a98d581e4
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
