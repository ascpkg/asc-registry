# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/crc
    REF boost-1.78.0
    SHA512 e913075402e98eb4a8e216bce3307d5339c924206640a1f389dfaeeca0336be29714852d1c8a40ab9a7c4f40efd37d433cc7c717324911d48ee4b845c1ebdf83
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
