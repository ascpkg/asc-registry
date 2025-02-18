# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/move
    REF boost-1.70.0
    SHA512 09291516819adcfed88c490607a865c6ef4beadac9ee4f948bab90e8fc4f04d958de4601ffff1c9da19793eac6de68b0dd5dfa541cb6a5182d9246d5b06d80d4
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
