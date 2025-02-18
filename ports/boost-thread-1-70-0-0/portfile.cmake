# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/thread
    REF boost-1.70.0
    SHA512 2c29fc8f1ff805f126f162865c8bad51f8aa56942d54999fe0191bcf4bf8f472c070d7977e731ceb6d46ff9d0e6d39013a3df79bfe8f4ed4631906cd26c8537a
    HEAD_REF master
    PATCHES avoid-winapi.patch
)

include(${CURRENT_INSTALLED_DIR}/share/boost-build/boost-modular-build.cmake)
boost_modular_build(
    SOURCE_PATH ${SOURCE_PATH}
    REQUIREMENTS "<library>/boost/date_time//boost_date_time"
    OPTIONS /boost/thread//boost_thread
    BOOST_CMAKE_FRAGMENT ${CMAKE_CURRENT_LIST_DIR}/b2-options.cmake
)
include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
