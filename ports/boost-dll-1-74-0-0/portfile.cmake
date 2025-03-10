# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/dll
    REF boost-1.74.0
    SHA512 44feb49f793061404f3863f0906488828c136b577b6d1446211df57f668d85c4ccac971e8c807afbe8a6837f482d3d5827ecc999abe2156e5149cb00aece4351
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
