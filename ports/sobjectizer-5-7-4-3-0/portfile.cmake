vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO stiffstream/sobjectizer
    REF "v.${VERSION}"
    SHA512 7bdd89ac3fefa2df4813872f34ab74183352addbb559c06d04f943a71de779add115da030ef96ba29708672a1daa6e72ccba72de39c4c02cbea173ea029874ad
)

string(COMPARE EQUAL "${VCPKG_LIBRARY_LINKAGE}" "static" SOBJECTIZER_BUILD_STATIC )
string(COMPARE EQUAL "${VCPKG_LIBRARY_LINKAGE}" "dynamic" SOBJECTIZER_BUILD_SHARED)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/dev"
    OPTIONS
        -DSOBJECTIZER_BUILD_STATIC=${SOBJECTIZER_BUILD_STATIC}
        -DSOBJECTIZER_BUILD_SHARED=${SOBJECTIZER_BUILD_SHARED}
)

vcpkg_cmake_install()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/sobjectizer)

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)

