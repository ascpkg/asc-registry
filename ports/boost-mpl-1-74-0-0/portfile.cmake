# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/mpl
    REF boost-1.74.0
    SHA512 85e57db3d2c9d92259dbbf5ebebb21db356572902070e4ed95e01675d370cf69df70eb1bb45b8bf49e47001e32f4ee56f2e247576985d80ac1413ab48176a0a9
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
