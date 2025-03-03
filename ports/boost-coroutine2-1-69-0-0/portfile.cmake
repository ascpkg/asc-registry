# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/coroutine2
    REF boost-1.69.0
    SHA512 278fdeedb5624d17a07ee4b9c1ea8864eb695042c19d59cd4cf519d89a9f33774bc2ee38b5e5c2eea18074abd23711d123549c0df414f65ecdb562256be5b3c3
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
