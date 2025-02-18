# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/signals2
    REF boost-1.67.0
    SHA512 5c691c9275ac2f640a46a1f5a03debd326ce1c64905af6475ebe6caced3ffa4fe27a3a6b91ce60c72bcf06fcd5fbeba79afaef8314f2be655b1ad648d5a046e4
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
