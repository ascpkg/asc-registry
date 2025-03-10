# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/lexical_cast
    REF boost-1.69.0
    SHA512 3cb8d3a300656b550d22959552e512369239a72336310678c13277f6f94fe29725c1645fdac4a0ff6035a2728e30baa3bd97e2e412d910eda2f882eb263fe3ed
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
