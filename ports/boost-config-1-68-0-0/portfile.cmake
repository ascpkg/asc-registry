# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/config
    REF boost-1.68.0
    SHA512 2b10be87e3d1a9a64b8b4459ca3427bf6187c53eeaf4551cf3755e4ee6b45e16a28539db0780e6392a3bf862feccffb38042cfb3a8d7f230caa5139ee94b713e
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
file(APPEND ${CURRENT_PACKAGES_DIR}/include/boost/config/user.hpp "\n#ifndef BOOST_ALL_NO_LIB\n#define BOOST_ALL_NO_LIB\n#endif\n")
file(APPEND ${CURRENT_PACKAGES_DIR}/include/boost/config/user.hpp "\n#undef BOOST_ALL_DYN_LINK\n")

if (VCPKG_LIBRARY_LINKAGE STREQUAL dynamic)
    file(APPEND ${CURRENT_PACKAGES_DIR}/include/boost/config/user.hpp "\n#define BOOST_ALL_DYN_LINK\n")
endif()
file(COPY ${SOURCE_PATH}/checks DESTINATION ${CURRENT_PACKAGES_DIR}/share/boost-config)
