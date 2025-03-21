# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/logic
    REF boost-1.76.0
    SHA512 6795e97a02f1b02c115951a075338fb62bf7458e30bd297071940d5a68990f0860736b29a18adbcf6bd3ca8c1af4042ddf64054c2ba873e54da3cbd587c098c4
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
