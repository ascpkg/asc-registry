# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/tti
    REF boost-1.69.0
    SHA512 1c8c0ea6e47ea4565d280e9ad465851d1f8abf14639676112a45e275889e1cfb9b517c5f12a9e26c32c465c24e93a843f46ea5854060ed7a96ba29bc1f5e687e
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
