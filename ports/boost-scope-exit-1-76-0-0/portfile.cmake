# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/scope_exit
    REF boost-1.76.0
    SHA512 addc6040749187ca5c6d22d9c33ef839422658f80588841b2c722c508049e04c6b41a228c739066438c9562ffc1c35cc2ec3f3e4ea5b2443fdef532e5708d08f
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
