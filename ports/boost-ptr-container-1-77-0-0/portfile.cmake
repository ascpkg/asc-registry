# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/ptr_container
    REF boost-1.77.0
    SHA512 31075bef92e568c125e03177ad6222f8708f86f09e469a894c676036e4fb57cee6befb709b22f23d0949fb7e9f5280417e6109d3ba2b756ec6e735783222d531
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
