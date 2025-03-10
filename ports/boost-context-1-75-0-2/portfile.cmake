# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/context
    REF boost-1.75.0
    SHA512 e1ba126cf1c785c38e196c1eddc347b5b06badf980d3b83d7b1c41d77ca060fbe18b34758d5beadcb53d54e13ce76775fcea24963f1754fab4e482da099cfade
    HEAD_REF master
    PATCHES fix_exports_for_32bit_GNU_asm_for_windows.patch
)

file(READ "${SOURCE_PATH}/build/Jamfile.v2" _contents)
string(REPLACE "import ../../config/checks/config" "import config/checks/config" _contents "${_contents}")
file(WRITE "${SOURCE_PATH}/build/Jamfile.v2" "${_contents}")
file(COPY "${CURRENT_INSTALLED_DIR}/share/boost-config/checks" DESTINATION "${SOURCE_PATH}/build/config")

include(${CURRENT_INSTALLED_DIR}/share/boost-build/boost-modular-build.cmake)
configure_file(
    "${CMAKE_CURRENT_LIST_DIR}/b2-options.cmake.in"
    "${CURRENT_BUILDTREES_DIR}/vcpkg-b2-options.cmake"
    @ONLY
)
boost_modular_build(
    SOURCE_PATH ${SOURCE_PATH}
    BOOST_CMAKE_FRAGMENT "${CURRENT_BUILDTREES_DIR}/vcpkg-b2-options.cmake"
)
include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})

# boost-context removed all.hpp, which is used by FindBoost to determine that context is installed
if(NOT EXISTS ${CURRENT_PACKAGES_DIR}/include/boost/context/all.hpp)
    file(WRITE ${CURRENT_PACKAGES_DIR}/include/boost/context/all.hpp
        "#error \"#include <boost/context/all.hpp> is no longer supported by boost_context.\"")
endif()
