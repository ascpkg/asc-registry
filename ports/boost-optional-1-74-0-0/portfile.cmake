# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/optional
    REF boost-1.74.0
    SHA512 571cba3c4be579c19bb1f46f2d40a026ad4c8cb03015e8900fd0f7342b32138fb4beec8beb281d823e9ac6b841f302db86a9ad62fbde377dc9672fefbdaa7b3c
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
