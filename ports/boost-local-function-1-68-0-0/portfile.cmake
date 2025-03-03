# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/local_function
    REF boost-1.68.0
    SHA512 063158b6a66f82521298b22a597442671219e76a038452cb163de6f095682cfbfaf998a2b69adcd2913f9cf8a633b7e99b1e540a60e3c95092162806b92d23f0
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
