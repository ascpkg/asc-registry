include(vcpkg_common_functions)

if (VCPKG_LIBRARY_LINKAGE STREQUAL dynamic)
    message(STATUS "Speex doesn't support visibility on Win32 yet. Building static.")
    message(STATUS "See https://github.com/xiph/speex/blob/master/win32/config.h for more")
    set(VCPKG_LIBRARY_LINKAGE static)
endif()

vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO xiph/speex
  REF cae5026cfd88782c7051af6e685059223578b7e9
  SHA512  93385363561c41f5c6bb7fce8e7cd1954520191a4741a8618daaf0a0bfa0c5c5de9926b989f1ae85b99bf4307afb445f307a01a9487abcc0d4ffa690711b8e49
  HEAD_REF master
)

file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH})

vcpkg_configure_cmake(
  SOURCE_PATH ${SOURCE_PATH}
  PREFER_NINJA
  OPTIONS_DEBUG -DDISABLE_INSTALL_HEADERS=ON
)

vcpkg_install_cmake()

file(INSTALL ${SOURCE_PATH}/COPYING DESTINATION ${CURRENT_PACKAGES_DIR}/share/speex RENAME copyright)
