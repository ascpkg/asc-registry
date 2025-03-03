include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO witwall/mman-win32
    REF f5ff813c53935c3078f48e1f03a6944c4e7b459c
    SHA512 49c9a63a0a3c6fa585a76e65425f6fb1fdaa23cc87e53d5afb7a1298bcd4956298c076ee78f24dd5df5f5a0c5f6244c6abb63b40818e4d2546185fa37a73bf0d
    HEAD_REF master
)

vcpkg_apply_patches(
    SOURCE_PATH ${SOURCE_PATH}
    PATCHES
        ${CMAKE_CURRENT_LIST_DIR}/mman-static.patch
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
)

vcpkg_install_cmake()

file(INSTALL ${SOURCE_PATH}/README.md DESTINATION ${CURRENT_PACKAGES_DIR}/share/mman RENAME copyright)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)

if(VCPKG_LIBRARY_LINKAGE STREQUAL "static")
    file(READ ${CURRENT_PACKAGES_DIR}/include/sys/mman.h _contents)
    string(REPLACE "__declspec(dllimport)" "" _contents "${_contents}")
    file(WRITE ${CURRENT_PACKAGES_DIR}/include/sys/mman.h "${_contents}")
endif()

vcpkg_copy_pdbs()
