# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/static_assert
    REF boost-1.76.0
    SHA512 efd94b25d66f9841d41c8ad22e751e8489fc78de68172554ec2a82be61b7163c6b90fff56ab8dcf14da7b03770c6f2d14f317be5abbef796dc4d4366efd6498f
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
