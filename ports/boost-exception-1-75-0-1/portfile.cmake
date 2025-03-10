# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/exception
    REF boost-1.75.0
    SHA512 fe7c62f3970b7041ac94922105305696374fbee59f8cfe3a48035f6487e616f430a1a577bfad997e2be34dc50393b9301726ca27612689f9275b64633c3fab1e
    HEAD_REF master
)

if(NOT DEFINED CURRENT_HOST_INSTALLED_DIR)
    message(FATAL_ERROR "boost-exception requires a newer version of vcpkg in order to build.")
endif()
include(${CURRENT_HOST_INSTALLED_DIR}/share/boost-build/boost-modular-build.cmake)
boost_modular_build(SOURCE_PATH ${SOURCE_PATH})
include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})

set(VCPKG_LIBRARY_LINKAGE static)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/bin ${CURRENT_PACKAGES_DIR}/debug/bin)
