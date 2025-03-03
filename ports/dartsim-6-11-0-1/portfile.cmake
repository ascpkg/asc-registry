# Shared library support is broken upstream (https://github.com/dartsim/dart/issues/1005#issuecomment-375406260)
vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO dartsim/dart
    REF v6.11.0
    SHA512 01fbff039bcec71d41334db2d07d0973b1ba58d30d05b29e35e1e3cee853917753b64e1101881113a33adb801559855d38d274fbb3383cfb24d85565254d112d
    HEAD_REF main
    PATCHES
        disable_unit_tests_examples_and_tutorials.patch
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS
        -DDART_VERBOSE=ON
        -DDART_MSVC_DEFAULT_OPTIONS=ON
        -DDART_SKIP_DOXYGEN=ON
        -DDART_SKIP_FLANN=ON
        -DDART_SKIP_IPOPT=ON
        -DDART_SKIP_NLOPT=ON
        -DDART_SKIP_OPENGL=ON
        -DDART_SKIP_pagmo=ON
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(CONFIG_PATH share/dart/cmake PACKAGE_NAME dart)

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/share/doc)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/share)

# Handle copyright
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
