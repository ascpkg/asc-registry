# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/mpl
    REF boost-1.66.0
    SHA512 e88fa03fbc0f876f838826c5ccfd3866425fa87fd81b9aeb83e4c0afded189a66b06206230f07d1177bdbc39ea5b15cb050ad6285d7704ea83bb43c7d608cc1b
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
