# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/qvm
    REF boost-1.74.0
    SHA512 cd94af7b31ce7a0d610f221dbb2fa2f9d1bc6f4622176bde1d890af7e220cd524ce1a5064a9f3f10bc248f4ce6dc4432900b732357ed0aaba18613460d2bee35
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
