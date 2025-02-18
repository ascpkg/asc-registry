# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/detail
    REF boost-1.73.0
    SHA512 d6955323769c5ec647648dc13baa18880b34c2b24cd80b10b638b410fa552819902eabf72093d464ba9582f507b7a19268d15422e4401cc0e3ce3aa93129f15d
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
