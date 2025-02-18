# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/gil
    REF boost-1.66.0
    SHA512 f60c452740e56810ee967aab68b61277af0b467085bb7594dfbdea07e02354f2533983f88867c788862bc30c027720f8aeff2ab8f5a251c1a2b7c686b43064bc
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
