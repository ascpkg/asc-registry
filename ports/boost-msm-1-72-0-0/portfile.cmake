# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/msm
    REF boost-1.72.0
    SHA512 24ed94cb47810286595acd53b139528db155c9044c85e4c886dd001afd98fd03ef261cca497e6c94b9c92fc695f3f82d87960ba09866bc2813cdb5dbe3f7dacf
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
