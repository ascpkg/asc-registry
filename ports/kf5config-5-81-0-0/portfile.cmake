vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO KDE/kconfig
    REF v5.81.0
    SHA512 148bdca3f3548b892abacf25f82d2bb4a3eb7a3dc559b30722e7e12a8fdcb240ff86d5e56396efd17d65d40a7b7dd9568a8d204ac48c073b132fe3e93a903c98
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS 
        -DBUILD_HTML_DOCS=OFF
        -DBUILD_MAN_DOCS=OFF
        -DBUILD_QTHELP_DOCS=OFF
        -DBUILD_TESTING=OFF
)

vcpkg_install_cmake()

file(MAKE_DIRECTORY ${CURRENT_PACKAGES_DIR}/tools/${PORT})

if(VCPKG_TARGET_IS_WINDOWS OR VCPKG_TARGET_IS_UWP)
    file(RENAME ${CURRENT_PACKAGES_DIR}/bin/kconfig_compiler_kf5.exe ${CURRENT_PACKAGES_DIR}/tools/${PORT}/kconfig_compiler_kf5.exe)
    file(RENAME ${CURRENT_PACKAGES_DIR}/bin/kconf_update.exe ${CURRENT_PACKAGES_DIR}/tools/${PORT}/kconf_update.exe)
    file(REMOVE ${CURRENT_PACKAGES_DIR}/bin/kreadconfig5.exe)
    file(REMOVE ${CURRENT_PACKAGES_DIR}/bin/kwriteconfig5.exe)
    file (GLOB EXES ${CURRENT_PACKAGES_DIR}/debug/bin/*.exe)
    file(REMOVE ${EXES})
else()
    file(REMOVE ${CURRENT_PACKAGES_DIR}/bin/kreadconfig5)
    file(REMOVE ${CURRENT_PACKAGES_DIR}/bin/kwriteconfig5)
    file(REMOVE ${CURRENT_PACKAGES_DIR}/debug/bin/kreadconfig5)
    file(REMOVE ${CURRENT_PACKAGES_DIR}/debug/bin/kwriteconfig5)
endif()

vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/KF5Config)

vcpkg_copy_tool_dependencies(${CURRENT_PACKAGES_DIR}/tools/${PORT})
file(APPEND ${CURRENT_PACKAGES_DIR}/tools/${PORT}/qt.conf "Data = ../../data")
vcpkg_copy_pdbs()

if(VCPKG_LIBRARY_LINKAGE STREQUAL "static")	
    file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/bin" "${CURRENT_PACKAGES_DIR}/debug/bin")	
endif()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/bin/data)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/bin/data)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/share)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/etc)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/etc)
file(INSTALL ${SOURCE_PATH}/LICENSES/ DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT}/copyright)
