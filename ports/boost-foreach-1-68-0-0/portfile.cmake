# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/foreach
    REF boost-1.68.0
    SHA512 501f7caf4f0f4119e110aaacd6530cc7ed6df75b39e9fbd4e3423e4089f7ebdf2ae918a09ae140fdee4ef4eb9f787df21fe1c664aa031cdf1bf4fc447c9c69b0
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
