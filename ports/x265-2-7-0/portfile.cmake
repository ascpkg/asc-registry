include(vcpkg_common_functions)

vcpkg_from_bitbucket(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO multicoreware/x265
    REF 2.7
    SHA512 fd2f43830bbe4fa0ac98ac6d8e3689d0a8a5142da9d67c0dd16fbbde40500c52a370c5c5a30e93195c2e998660a51abab76b09baed87378c9e366cf2f694f2b9
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}/source
    PREFER_NINJA
)

vcpkg_install_cmake()
vcpkg_copy_pdbs()

# remove duplicated include files
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)

file(MAKE_DIRECTORY ${CURRENT_PACKAGES_DIR}/tools/x265)
file(RENAME ${CURRENT_PACKAGES_DIR}/bin/x265.exe ${CURRENT_PACKAGES_DIR}/tools/x265/x265.exe)
file(REMOVE ${CURRENT_PACKAGES_DIR}/debug/bin/x265.exe)
vcpkg_copy_tool_dependencies(${CURRENT_PACKAGES_DIR}/tools/x265)

# Handle copyright
file(COPY ${SOURCE_PATH}/COPYING DESTINATION ${CURRENT_PACKAGES_DIR}/share/x265)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/x265/COPYING ${CURRENT_PACKAGES_DIR}/share/x265/copyright)