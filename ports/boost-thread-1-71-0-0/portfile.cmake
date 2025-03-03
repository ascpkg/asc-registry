# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/thread
    REF boost-1.71.0
    SHA512 0f0de2823f2fb2c5a44824555223dbd8e1cf6072b918ebd959c0b51547ffe7db6dcf5d675d7d229406eaf1bccfe7d3041318932d4020b33bbd4da722f9aa4cce
    HEAD_REF master
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
