# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/asio
    REF boost-1.67.0
    SHA512 b7497608afa49580eeb9a74feefc624eb66a3e6db21f2a65291ccb287fe60dc8d923a9143bc10e73b8508ec2ef094e6caf2ef96528790c5324b6aceced55f29f
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})