# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/multi_array
    REF boost-1.69.0
    SHA512 f8fc2648333eecbe97c16560182b26e6e8f44299ab75d09fbe34ed45640dbffba7cd0a7b1fce33bdc8a0f49b611d2269bff74936082ef412628e7341c16ee423
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
