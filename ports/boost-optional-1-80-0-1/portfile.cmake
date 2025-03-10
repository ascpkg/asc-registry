# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/optional
    REF boost-1.80.0
    SHA512 87934f110311e329ec7d08f6a16d17feb1e550bba2b66d261e04d9a367136e3067fedd5ecf8abd19fb68876b7bad95cbd2b731a15f786063fe50b51066ff8870
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
