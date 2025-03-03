# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/pool
    REF boost-1.80.0
    SHA512 ba7b65256ae92a8fccfafa067bfeffa974c33a8258db89e1d2081bb98f8c8904611ddc7c3f381559b3af4518fdb3ae9554efed9bc9455fcd8eba83bf29137b67
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
