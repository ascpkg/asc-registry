include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO IntelRealSense/librealsense
    REF v2.22.0
    SHA512 7595780c1955a2d4a91df5b70ab6366c672f389bc3d2dcb9f2e78a2ea1fc875c65f878103df483205e17f62dfd024ee5f7ccb15afc5d18978d3c25aa071652ab
    HEAD_REF development
)

string(COMPARE EQUAL "${VCPKG_CRT_LINKAGE}" "static" BUILD_CRT_LINKAGE)

set(BUILD_EXAMPLES OFF)
set(BUILD_GRAPHICAL_EXAMPLES OFF)
if("tools" IN_LIST FEATURES)
    set(BUILD_EXAMPLES ON)
    set(BUILD_GRAPHICAL_EXAMPLES ON)
endif()

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS
        -DENFORCE_METADATA=ON
        -DBUILD_WITH_TM2=OFF
        -DBUILD_WITH_OPENMP=OFF
        -DBUILD_UNIT_TESTS=OFF
        -DBUILD_WITH_STATIC_CRT=${BUILD_CRT_LINKAGE}
    OPTIONS_RELEASE
        -DBUILD_EXAMPLES=${BUILD_EXAMPLES}
        -DBUILD_GRAPHICAL_EXAMPLES=${BUILD_GRAPHICAL_EXAMPLES}
    OPTIONS_DEBUG
        -DBUILD_EXAMPLES=OFF
        -DBUILD_GRAPHICAL_EXAMPLES=OFF
)

vcpkg_install_cmake()

vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/realsense2)

vcpkg_copy_pdbs()


file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/share)

if(BUILD_EXAMPLES)
    file(GLOB EXEFILES_RELEASE 
        ${CURRENT_PACKAGES_DIR}/bin/rs-* 
        ${CURRENT_PACKAGES_DIR}/bin/realsense-*
    )

    if (EXEFILES_RELEASE)
        file(COPY ${EXEFILES_RELEASE} DESTINATION ${CURRENT_PACKAGES_DIR}/tools/realsense2)
        file(REMOVE ${EXEFILES_RELEASE})
    endif()

    vcpkg_copy_tool_dependencies(${CURRENT_PACKAGES_DIR}/tools/realsense2)

    file(GLOB BINS ${CURRENT_PACKAGES_DIR}/bin/*)
    if(NOT BINS)
        file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/bin ${CURRENT_PACKAGES_DIR}/debug/bin)
    endif()
endif()

file(COPY ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/realsense2)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/realsense2/LICENSE ${CURRENT_PACKAGES_DIR}/share/realsense2/copyright)
