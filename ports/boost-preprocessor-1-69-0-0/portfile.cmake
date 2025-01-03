# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/preprocessor
    REF boost-1.69.0
    SHA512 33366ae1f998644ef9d151037598facbb832cfbacad07c15a5076b61d9d1f7f2d4e0f45af0e87a437af0b43b134f88392aaf697f0144c838b7c6ad274d0f8fd5
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
