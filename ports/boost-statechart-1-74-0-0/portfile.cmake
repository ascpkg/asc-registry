# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/statechart
    REF boost-1.74.0
    SHA512 9bbba5c1a816c385f878ce144805c8fd662d88b4e18117785177b35003d2bc2cafb545a5c7f07ef0b479272f1fa2f18bd167dfdb5d8bd9197e723005d738848f
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
