
include(vcpkg_common_functions)

vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO greg7mdp/sparsepp
        REF 1.22
        SHA512 b660cd7de48fcab50d4a0df4e4813226b0b0a8a3791aba4e4cc6a456af7bba0be6694bc44781a7d00b5582b32b1d85b9afa83095b7e5c0a26d1b0344ddc94b0f
        HEAD_REF master
)

file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH})


vcpkg_configure_cmake(
        SOURCE_PATH ${SOURCE_PATH}
        PREFER_NINJA
        OPTIONS
            -DCMAKE_WINDOWS_EXPORT_ALL_SYMBOLS=ON
)

# Note: we could add: OPTIONS_DEBUG  -DDISABLE_INSTALL_HEADERS=ON
# but it's an header only package, so there's no INSTALL target. So
# we remove the duplicate headers.

vcpkg_install_cmake()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug)

vcpkg_copy_pdbs()

file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/sparsepp RENAME copyright)
