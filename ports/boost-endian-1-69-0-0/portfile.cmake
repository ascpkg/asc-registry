# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/endian
    REF boost-1.69.0
    SHA512 13f96af6696b8ba353ab7c11dc2b26db50038b44c44287dd927b78b7ff55fa6fb37002980c878e850cfbe7b1d264722bd632db88404ac2df641b5094229e5e99
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
