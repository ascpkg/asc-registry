# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/outcome
    REF boost-1.77.0
    SHA512 de4e84b43c8906fe4059249a526ea80d805bd9458cc30d467dd232a5326d199b1c38973645bf9115f19933d75998d767d1fea06e2a10edee8bf4453335927505
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
