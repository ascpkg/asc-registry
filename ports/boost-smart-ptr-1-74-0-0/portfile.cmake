# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/smart_ptr
    REF boost-1.74.0
    SHA512 ee3af28130697d76ba6f93f7e4be4d8fe33c38e0107db7227c640cdffde239eb497d35ae9d04fc4a928f9f3d4752ea7971ee833df1b0495287d1860010c6fa04
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
