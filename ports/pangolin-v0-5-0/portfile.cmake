include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO stevenlovegrove/Pangolin
    REF v0.5
    SHA512 7ebeec108f33f1aa8b1ad08e3ca128a837b22d33e3fc580021f981784043b023a1bf563bbfa8b51d46863db770b336d24fc84ee3d836b85e0da1848281b2a5b2
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS
        -DCMAKE_WINDOWS_EXPORT_ALL_SYMBOLS=ON
)

vcpkg_install_cmake()

vcpkg_fixup_cmake_targets(CONFIG_PATH "lib/cmake/Pangolin")

vcpkg_copy_pdbs()

file(GLOB EXE ${CURRENT_PACKAGES_DIR}/lib/*.dll)
file(COPY ${EXE} DESTINATION ${CURRENT_PACKAGES_DIR}/bin)
file(REMOVE ${EXE})

file(GLOB DEBUG_EXE ${CURRENT_PACKAGES_DIR}/debug/lib/*.dll)
file(COPY ${DEBUG_EXE} DESTINATION ${CURRENT_PACKAGES_DIR}/debug/bin)
file(REMOVE ${DEBUG_EXE})

file(READ ${CURRENT_PACKAGES_DIR}/share/pangolin/PangolinTargets-debug.cmake PANGOLIN_TARGETS)
string(REPLACE "lib/pangolin.dll" "bin/pangolin.dll" PANGOLIN_TARGETS "${PANGOLIN_TARGETS}")
file(WRITE ${CURRENT_PACKAGES_DIR}/share/pangolin/PangolinTargets-debug.cmake "${PANGOLIN_TARGETS}")

file(READ ${CURRENT_PACKAGES_DIR}/share/pangolin/PangolinTargets-release.cmake PANGOLIN_TARGETS)
string(REPLACE "lib/pangolin.dll" "bin/pangolin.dll" PANGOLIN_TARGETS "${PANGOLIN_TARGETS}")
file(WRITE ${CURRENT_PACKAGES_DIR}/share/pangolin/PangolinTargets-release.cmake "${PANGOLIN_TARGETS}")

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)

# Put the license file where vcpkg expects it
file(COPY ${SOURCE_PATH}/LICENCE DESTINATION ${CURRENT_PACKAGES_DIR}/share/Pangolin/)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/Pangolin/LICENCE ${CURRENT_PACKAGES_DIR}/share/Pangolin/copyright)
