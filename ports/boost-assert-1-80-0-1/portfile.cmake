# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/assert
    REF boost-1.80.0
    SHA512 23bea8a04fa880aea4bb19ee1f8bcb27123997bec494c9826460ab9b1dc1b9918d2162157a2d2666cf605a739ea859bbf3998dc3485d75f47be50969a246f35e
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
