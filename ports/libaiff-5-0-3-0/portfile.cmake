vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_download_distfile(ARCHIVE
    URLS "https://sourceforge.net/projects/aifftools/files/libaiff/LibAiff%205.0/libaiff-5.0-release.tar.gz"
    FILENAME "libaiff-5.0-release.tar.gz"
    SHA512 7800f9a3fbd0c5a17b8cc6c9b60181131d159ab5f5fb8e7de54e8f88c151717a988231de664a635e61940267c854a9ce83d58b12e322dcdda3aa8080c7b15f66
)

vcpkg_extract_source_archive_ex(
    ARCHIVE ${ARCHIVE}
    OUT_SOURCE_PATH SOURCE_PATH
    PATCHES
        "${CMAKE_CURRENT_LIST_DIR}/allow_utf_16_filename.patch"
        "${CMAKE_CURRENT_LIST_DIR}/buffer_uninitialized.patch"
)

file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH})
file(COPY ${CMAKE_CURRENT_LIST_DIR}/config.h DESTINATION ${SOURCE_PATH}/libaiff)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS_DEBUG
        -DDISABLE_INSTALL_HEADERS=ON
)

vcpkg_install_cmake()

file(GLOB HEADERS "${CURRENT_PACKAGES_DIR}/include/libaiff/*.h")
foreach(HEADER ${HEADERS})
  file(READ "${HEADER}" _contents)
  string(REPLACE "#ifdef HAVE_STDINT_H" "#if 1" _contents "${_contents}")
  string(REPLACE "#ifdef HAVE_STRING_H" "#if 1" _contents "${_contents}")
  string(REPLACE "#ifdef HAVE_STDLIB_H" "#if 1" _contents "${_contents}")
  string(REPLACE "#ifdef HAVE_INTTYPES_H" "#if 1" _contents "${_contents}")
  file(WRITE "${HEADER}" "${_contents}")
endforeach()

# Handle copyright
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
