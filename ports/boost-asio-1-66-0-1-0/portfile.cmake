# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/asio
    REF boost-1.66.0
    SHA512 7d9989bd96b2940183a1aa75e7f7a6cec0ecf630922009d440ba876802411eba80ddc9b22bd4af65d6f12e3414eb130dc27a884c53bceabdfe8bafb9772db01f
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
