# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/process
    REF boost-1.72.0
    SHA512 bc881bcfa817e848151d90a0837683b9833395a7f7b76de76c40c96615bb1da7d10c0dae84f6b70b47fdf762a62869cb1700730a74fe123901803128f9194a52
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
