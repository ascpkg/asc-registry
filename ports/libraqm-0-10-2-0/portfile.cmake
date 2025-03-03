vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

string(REGEX MATCH "([0-9]+)\\.([0-9]+)\\.([0-9]+)" RAQM_VERSION "${VERSION}")
set(RAQM_VERSION_MAJOR ${CMAKE_MATCH_1})
set(RAQM_VERSION_MINOR ${CMAKE_MATCH_2})
set(RAQM_VERSION_MICRO ${CMAKE_MATCH_3})

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO HOST-Oman/libraqm
    REF v${RAQM_VERSION_MAJOR}.${RAQM_VERSION_MINOR}.${RAQM_VERSION_MICRO}
    SHA512 f79ecdff611512d5446d031e9ee45b8e6a7ed41777a99fb572ddbdc3db33542765fefb7a6c5825998510772cf76e277fe3f24eea45f9e0add20c162d7821eb9a
    HEAD_REF master
)

file(COPY "${CURRENT_PORT_DIR}/FindFribidi.cmake" DESTINATION "${SOURCE_PATH}")
file(COPY "${CURRENT_PORT_DIR}/CMakeLists.txt" DESTINATION "${SOURCE_PATH}")

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS
        -DCURRENT_PACKAGES_DIR=${CURRENT_PACKAGES_DIR}
        -DRAQM_VERSION_MAJOR=${RAQM_VERSION_MAJOR}
        -DRAQM_VERSION_MINOR=${RAQM_VERSION_MINOR}
        -DRAQM_VERSION_MICRO=${RAQM_VERSION_MICRO}
)

vcpkg_cmake_install()

vcpkg_copy_pdbs()

# Handle copyright
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/COPYING")

