# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/optional
    REF boost-1.67.0
    SHA512 a161c9bc69cb39d9828be89d9113766d930ef0c1b12de113b5d103e8139fceabdaac0081664f14ef96f1f9df1fac0b36469010766da3ba4c054910244c452bc8
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
