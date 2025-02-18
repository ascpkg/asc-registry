# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/beast
    REF boost-1.80.0
    SHA512 b8ed78521a228e91346868fd1dd1d5d543b396e49895c889887a23065aac4253c4e7cb19b89712ee6a332f5ae73807fa75b82d57ddd2bd47b49ace5cb03cfa6e
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
