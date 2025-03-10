# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/proto
    REF boost-1.80.0
    SHA512 996e7d1670d7b6b1389b88bb78946e8afbb37de87f1e819093df35d3237eff5c6d84aaf66ab010a32ff897b73d8a631b1fd1afc958c95cf85295be57c7cf1e1f
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
