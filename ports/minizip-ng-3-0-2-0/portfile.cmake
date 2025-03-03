vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO zlib-ng/minizip-ng
    REF 3.0.2
    SHA512 eee4d35d273ab0a32972b119c8faabd8c242e2d9f506fab0dd21fdd24c78b932c01bf7f15e9cf7c452776fc4c2e27a5ff09e376adb7a706336d11114929182fc
    HEAD_REF master
    PATCHES 
        Modify-header-file-path.patch
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA 
    DISABLE_PARALLEL_CONFIGURE
    OPTIONS 
        -DMZ_PROJECT_SUFFIX:STRING=-ng
)

vcpkg_cmake_install()

vcpkg_fixup_pkgconfig()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/${PORT})
vcpkg_copy_pdbs()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

configure_file("${SOURCE_PATH}/LICENSE" "${CURRENT_PACKAGES_DIR}/share/minizip-ng/copyright" COPYONLY)
