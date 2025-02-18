# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/local_function
    REF boost-1.71.0
    SHA512 9e4e08e1aac0db4f2db946de9b94152437423f1c514cb1d9cd8f5b81c18fa41bce832b8936efd4bab0357a0d1c1f2254205ace649afd879b9679c7868e0041d4
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
