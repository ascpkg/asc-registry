# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/circular_buffer
    REF boost-1.67.0
    SHA512 1c1f085f81def77135b95fd3255ef0280c84c7f899b632b91c28bdc33dcfff8eaef3f9f233a356499756305a11c4a33022b72a46b990ec56db73ac4036711c45
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
