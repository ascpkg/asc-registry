# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/safe_numerics
    REF boost-1.71.0
    SHA512 56dc050a342b132a4ed2685bd26bdf88a57abc817ce4677e59bb265d9a0b5a2807ab9819379265213868d2c40af12686d93a1fea01e20abbf92ffa561d8b0c56
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
