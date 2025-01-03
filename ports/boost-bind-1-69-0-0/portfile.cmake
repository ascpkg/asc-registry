# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/bind
    REF boost-1.69.0
    SHA512 8445e5359d52cf71f0a818c507cfe4746e7966694691e6acaf7284855532245228bbfc3b26fb89d631e1a4d8de72d1a28e50ee60255c8955bef6a28a04b92105
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
