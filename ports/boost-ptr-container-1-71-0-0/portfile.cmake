# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/ptr_container
    REF boost-1.71.0
    SHA512 c5681cba8af9412d02be1ff4ea889600d09fb342f89ae3ce8e508721aebac26023b5bfcb0250090f3458fddf44126e0e7a5770b04356d4839e8db7cebc9ebba6
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
