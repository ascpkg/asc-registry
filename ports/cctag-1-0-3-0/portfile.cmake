vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO alicevision/cctag
    REF "v${VERSION}"
    SHA512 ccae0829480eca2a25cae70a5bf2cb3fde5ae1f71a08a9b614c05a1bb746ad66d6ac70f590ac8096635ea4fe75590d0ecb1c8c9f1b77189e5eae6f5e59c78cfe
    HEAD_REF develop
    PATCHES
        fix-compatibility-with-boost-1.85.patch
)

file(REMOVE "${SOURCE_PATH}/cmake/FindTBB.cmake" "${SOURCE_PATH}/src/applications/cmake/FindTBB.cmake")

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
        FEATURES
            cuda       CCTAG_WITH_CUDA
            apps       CCTAG_BUILD_APPS
)

if("cuda" IN_LIST FEATURES)
    vcpkg_find_cuda(OUT_CUDA_TOOLKIT_ROOT CUDA_TOOLKIT_ROOT)
    message(STATUS "CUDA_TOOLKIT_ROOT ${CUDA_TOOLKIT_ROOT}")
endif()

vcpkg_cmake_configure(
    SOURCE_PATH  "${SOURCE_PATH}"
    OPTIONS -DCCTAG_BUILD_TESTS:BOOL=OFF ${FEATURE_OPTIONS}
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/CCTag)

vcpkg_copy_pdbs()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include" "${CURRENT_PACKAGES_DIR}/debug/share")

# remove test files
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/cctag/geometry/test" "${CURRENT_PACKAGES_DIR}/include/cctag/test")
# remove cuda headers
if(NOT "cuda" IN_LIST FEATURES)
    file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/cctag/cuda")
endif()

 # move the bin directory to tools
if ("apps" IN_LIST FEATURES)
    set(CCTAG_TOOLS detection regression simulation)
    vcpkg_copy_tools(TOOL_NAMES ${CCTAG_TOOLS} AUTO_CLEAN)
endif()

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/COPYING.md")
