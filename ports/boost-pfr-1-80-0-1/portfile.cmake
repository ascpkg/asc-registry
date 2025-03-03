# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/pfr
    REF boost-1.80.0
    SHA512 f0c8f70730c41beb1a940172f53cb394146da4b3e3e8c6a0ed15162747254392743c9bc65bd73e96926bae92414f135c4e0d88760e587279227947289e902b51
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
