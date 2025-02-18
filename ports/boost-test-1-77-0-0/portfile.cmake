# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/test
    REF boost-1.77.0
    SHA512 017807e1af6aec76211e6b452f5bdeba6d8df47916c4e9f119fd38b184bb380f97e4584febf6c60305f6de9386888bbac3c59fb93be2368338e4d4bbb293f916
    HEAD_REF master
)

file(READ "${SOURCE_PATH}/build/Jamfile.v2" _contents)
string(REPLACE "import ../../predef/check/predef" "import predef/check/predef" _contents "${_contents}")
file(WRITE "${SOURCE_PATH}/build/Jamfile.v2" "${_contents}")
file(COPY "${CURRENT_INSTALLED_DIR}/share/boost-predef/check" DESTINATION "${SOURCE_PATH}/build/predef")

if(NOT DEFINED CURRENT_HOST_INSTALLED_DIR)
    message(FATAL_ERROR "boost-test requires a newer version of vcpkg in order to build.")
endif()
include(${CURRENT_HOST_INSTALLED_DIR}/share/boost-build/boost-modular-build.cmake)
boost_modular_build(SOURCE_PATH ${SOURCE_PATH})
include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
if(NOT DEFINED VCPKG_BUILD_TYPE OR VCPKG_BUILD_TYPE STREQUAL "release")
    file(MAKE_DIRECTORY ${CURRENT_PACKAGES_DIR}/lib/manual-link)
    file(GLOB MONITOR_LIBS ${CURRENT_PACKAGES_DIR}/lib/*_exec_monitor*)
    file(COPY ${MONITOR_LIBS} DESTINATION ${CURRENT_PACKAGES_DIR}/lib/manual-link)
    file(REMOVE ${MONITOR_LIBS})
endif()

if(NOT DEFINED VCPKG_BUILD_TYPE OR VCPKG_BUILD_TYPE STREQUAL "debug")
    file(MAKE_DIRECTORY ${CURRENT_PACKAGES_DIR}/debug/lib/manual-link)
    file(GLOB DEBUG_MONITOR_LIBS ${CURRENT_PACKAGES_DIR}/debug/lib/*_exec_monitor*)
    file(COPY ${DEBUG_MONITOR_LIBS} DESTINATION ${CURRENT_PACKAGES_DIR}/debug/lib/manual-link)
    file(REMOVE ${DEBUG_MONITOR_LIBS})
endif()

