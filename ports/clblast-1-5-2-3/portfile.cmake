vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO CNugteren/CLBlast
    REF 1.5.2
    SHA512 6693704321bb7623a632ebfc71dcf07bbe4ba6c6f03a2ecf52bc10b401ae546bf82cdd3f6cc28aa9ea10f40dc7b2e86a6530f32cfbd522e24d4cf6a75c8c1100
    HEAD_REF master
    PATCHES
        fix_install_path.patch
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DTUNERS=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/CLBLast)
vcpkg_copy_pdbs()
vcpkg_fixup_pkgconfig()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
