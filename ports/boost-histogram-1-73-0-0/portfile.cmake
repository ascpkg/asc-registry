# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/histogram
    REF boost-1.73.0
    SHA512 b070f0fcbf5e285fda47861db903bc11f60122415dfb212c81b8eaafcf346364dfaf201ab2c759fb5547a5c34825ec528c8b19b88a7840fe51cc28b10f8f1d92
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
