vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

set(RAQM_VERSION_MAJOR 0)
set(RAQM_VERSION_MINOR 10)
set(RAQM_VERSION_MICRO 1)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO HOST-Oman/libraqm
    REF v${RAQM_VERSION_MAJOR}.${RAQM_VERSION_MINOR}.${RAQM_VERSION_MICRO}
    SHA512 d35fd37764c153235ad89721be7a2a11212c1d3241383d81499ca5fe83e90d625e29e42a00edd626bff78bd0f72209f36826c84f59cd1504258079ed532329b6
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

