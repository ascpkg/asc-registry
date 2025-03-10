# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/phoenix
    REF boost-1.70.0
    SHA512 d8e42ecd1e93fc3e48a1b1f0de9d2054f73e5d591da71af09f664b94edfa612ff377c20d2d913ed3790bca4d5ff74d176c50e298f979c88e5db5bf80ea239f2d
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
