# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/regex
    REF boost-1.69.0
    SHA512 7ca27b7585ea3627117275711a29c3ed2a5882e0cad7028ccdf63fbd09380807ffa9e344705ea86846b75f45b85f04ad7cc28149c6ba61579684fd6f9febbd48
    HEAD_REF master
)

if("icu" IN_LIST FEATURES)
    set(REQUIREMENTS "<library>/user-config//icuuc <library>/user-config//icudt <library>/user-config//icuin <define>BOOST_HAS_ICU=1")
else()
    set(REQUIREMENTS)
endif()

include(${CURRENT_INSTALLED_DIR}/share/boost-build/boost-modular-build.cmake)
boost_modular_build(SOURCE_PATH ${SOURCE_PATH} REQUIREMENTS "${REQUIREMENTS}")
include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
