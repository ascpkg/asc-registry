# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/callable_traits
    REF boost-1.74.0
    SHA512 b186092b99663ef34a78c48a1d64ef24a0604f92731bacb4ec6ec03a6bd2ffd1c6d3935b4410fc27ec5a66a98ab97d05841d97521f7021d894c1ee5421e20b26
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
