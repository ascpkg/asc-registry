# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/uuid
    REF boost-1.71.0
    SHA512 e815637e01d5e0ac7420c856c8afaa485399c202e37e7a03061ec2ad924843ab2f9cb5038e0677b326bb3aa19ff61b26a2945d10b5fc4b8b88de6e9e300de689
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
