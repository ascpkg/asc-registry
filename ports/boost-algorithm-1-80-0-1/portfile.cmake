# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/algorithm
    REF boost-1.80.0
    SHA512 4dd9e92b988b84bb18671a5742cd18e8b5a8eaee609f9fc510fb7285ce3dc43a1ceffa6ba37e2aa329bced6a24b34da85013acc7bacce848d992f667bfda07e0
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
