# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/safe_numerics
    REF boost-1.70.0
    SHA512 b5babfddc56f404602a5c071cef5505d534e1503ab08e9b6acc8e6fe4ebc87b9ae4db71d9c71cc3dcc739d17eea81ac0fe639f442db347e219be1acf39e6c2ef
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
