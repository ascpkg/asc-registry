# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/hana
    REF boost-1.66.0
    SHA512 cf105931ad59147edd97aaee29d9af4f069ada58c1c0f49eba7c3f921c5a412c90609853603504207526cf80c728f188ba4ee024fc2b7c8c924f98faf543167a
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
