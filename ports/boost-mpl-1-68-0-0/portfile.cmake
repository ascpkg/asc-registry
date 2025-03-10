# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/mpl
    REF boost-1.68.0
    SHA512 a35139c56fd06c560783844cb5b3ddc4643aa6aa7e3bce76e0b4f24d5b7ace962a0ade60973ab21083a06e824a4701c7b6c534376b2323934a21cda438f1de61
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
