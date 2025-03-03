# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/log
    REF boost-1.68.0
    SHA512 d12f9b2d8f782e4df5df16fe6c5267c87266348f6c7c400a9c6ff0b1b7af34ee8baf3d0b4dc4aef20b0a5faf4582d5c90d3429df84d903773bef3e61df93a0d9
    HEAD_REF master
)

file(READ "${SOURCE_PATH}/build/Jamfile.v2" _contents)
string(REPLACE "import ../../config/checks/config" "import config/checks/config" _contents "${_contents}")
string(REPLACE " <conditional>@select-arch-specific-sources" "#<conditional>@select-arch-specific-sources" _contents "${_contents}")
file(WRITE "${SOURCE_PATH}/build/Jamfile.v2" "${_contents}")
file(COPY "${CURRENT_INSTALLED_DIR}/share/boost-config/checks" DESTINATION "${SOURCE_PATH}/build/config")

file(READ ${SOURCE_PATH}/build/log-architecture.jam _contents)
string(REPLACE
    "\nproject.load [ path.join [ path.make $(here:D) ] ../../config/checks/architecture ] ;"
    "\nproject.load [ path.join [ path.make $(here:D) ] config/checks/architecture ] ;"
    _contents "${_contents}")
file(WRITE ${SOURCE_PATH}/build/log-architecture.jam "${_contents}")

include(${CURRENT_INSTALLED_DIR}/share/boost-build/boost-modular-build.cmake)
boost_modular_build(SOURCE_PATH ${SOURCE_PATH})
include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
