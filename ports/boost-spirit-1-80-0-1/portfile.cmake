# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/spirit
    REF boost-1.80.0
    SHA512 189d3d4216d37a78a0241f616d365df24a1e00abb6a84031be1fc5189b596f182c4d4002cbe5ffe0a62d7d2f0ef1cfafdab1ad18bcde1767ea560fc9104a848a
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
