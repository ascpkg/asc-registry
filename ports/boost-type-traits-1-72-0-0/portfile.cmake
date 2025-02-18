# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/type_traits
    REF boost-1.72.0
    SHA512 6f9959b53b2cc60539f065256e7efd78c8dad89d73803cea17bec82559f1045d069a6762a0665b5813ef397d3cf516b8897e2ea7be6177c5828f6d867869f367
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
