include(vcpkg_common_functions)

vcpkg_download_distfile(ARCHIVE
    URLS "https://download.gnome.org/sources/libcroco/0.6/libcroco-0.6.13.tar.xz"
    FILENAME "libcroco-0.6.13.tar.xz"
    SHA512 038a3ac9d160a8cf86a8a88c34367e154ef26ede289c93349332b7bc449a5199b51ea3611cebf3a2416ae23b9e45ecf8f9c6b24ea6d16a5519b796d3c7e272d4
)

vcpkg_extract_source_archive_ex(
    OUT_SOURCE_PATH SOURCE_PATH
    ARCHIVE ${ARCHIVE} 
)

file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH})
configure_file(${SOURCE_PATH}/config.h.win32 ${SOURCE_PATH}/src/config.h COPYONLY)
file(READ "${SOURCE_PATH}/src/libcroco.symbols" SYMBOLS)
string(REGEX REPLACE ";[^\n]*\n" "" DEF "EXPORTS\n${SYMBOLS}")
file(WRITE "${SOURCE_PATH}/src/libcroco.def" "${DEF}")

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
)

vcpkg_install_cmake()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/share)

# Handle copyright
file(INSTALL ${SOURCE_PATH}/COPYING DESTINATION ${CURRENT_PACKAGES_DIR}/share/libcroco RENAME copyright)

# Post-build test for cmake libraries
 vcpkg_test_cmake(PACKAGE_NAME libcroco)
