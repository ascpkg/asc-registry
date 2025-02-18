# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/multi_index
    REF boost-1.74.0
    SHA512 aff832e519a864439dac18cff42f339a8afa38075fbf1a7b0ada1233d95387087d1276fa03298b9d5bbd8ee7fc5decde639b12625489b2149020abd0767be1b0
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
