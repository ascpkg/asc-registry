# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/stacktrace
    REF boost-1.66.0
    SHA512 40b96f7c1fdaf5a5909148d7edd4f77b4991ead70d5350bc7c8451781c80020496b14688c0dff365b75941a1ba16244246a52b6a708f4b1f79c99f4d8a0556f0
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-build/boost-modular-build.cmake)
boost_modular_build(SOURCE_PATH ${SOURCE_PATH})
include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
