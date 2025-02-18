# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/integer
    REF boost-1.68.0
    SHA512 3d257bb5b8313c2a884fa9959efe1f6d287c06e1b5746cbc4f9ae5694e61dfb2821d07b355d7e544594c9922a1ec86009dc8f92de9fc4d7b74db3383a817b3ba
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
