# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/conversion
    REF boost-1.80.0
    SHA512 fff6ae3b7be67b1346c3b2027157a828ccf9c08279a104502707e262255291612f849a2d51ff4acc7768f31f2dae5311c3928fd56f5b97623d3781b25e62dd1e
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
