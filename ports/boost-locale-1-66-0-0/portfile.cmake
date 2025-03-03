# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/locale
    REF boost-1.66.0
    SHA512 558c84fe83909b9eb410ed5b846d2393733811e3765e99e41884a7fc7020163437a42584911b4f634706c1a0e79e23bb09bd6a3ffa219c9e524a10ace02728af
    HEAD_REF master
)

if("icu" IN_LIST FEATURES)
    set(BOOST_LOCALE_ICU on)
else()
    set(BOOST_LOCALE_ICU off)
endif()

include(${CURRENT_INSTALLED_DIR}/share/boost-build/boost-modular-build.cmake)
boost_modular_build(
    SOURCE_PATH ${SOURCE_PATH}
    BOOST_CMAKE_FRAGMENT "${CMAKE_CURRENT_LIST_DIR}/cmake-fragment.cmake"
    OPTIONS
        boost.locale.iconv=off
        boost.locale.posix=off
        /boost/locale//boost_locale
        boost.locale.icu=${BOOST_LOCALE_ICU}
)
include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
