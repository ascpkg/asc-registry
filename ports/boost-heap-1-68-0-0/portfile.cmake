# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/heap
    REF boost-1.68.0
    SHA512 3aac4ee8f4ce4c578f83fefb19532aa859c966fa807a2f156a2428c4e9d44e3e5c09ff4588b43a9dfe46f32dadde03e942f8025551c267e677b3aad20343cbd1
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
