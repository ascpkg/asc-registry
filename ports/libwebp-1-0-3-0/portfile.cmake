vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO webmproject/libwebp
  REF 0fe1a89dbf1930fc2554dbe76adad5d962054ead # v1.0.3
  SHA512 824844a247d3d0d89f1721b08304624b3d3ba0060e218f5c172ffd19d19b96a71d41055fdcda7e6f01a846a95c2519f52e0f39e9f49878e74ca9bb8a1df5fb13
  HEAD_REF master
  PATCHES
    0001-build-fixes.patch
    0002-cmake-config-add-backwards-compatibility.patch
    0003-remove-missing-symbol.patch
    0004-add-missing-linked-library.patch
    0005-fix-static-build.patch
    0006-fix-dependecies-platform.patch
    0007-fix-arm-build.patch
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
   FEATURES # <- Keyword FEATURES is required because INVERTED_FEATURES are being used
     anim         WEBP_BUILD_ANIM_UTILS
     gif2webp     WEBP_BUILD_GIF2WEBP
     img2webp     WEBP_BUILD_IMG2WEBP
     vwebp        WEBP_BUILD_VWEBP
     info         WEBP_BUILD_WEBPINFO
     mux          WEBP_BUILD_WEBPMUX
     extras       WEBP_BUILD_EXTRAS
     nearlossless WEBP_NEAR_LOSSLESS
     simd         WEBP_ENABLE_SIMD
     cwebp        WEBP_BUILD_CWEBP
     dwebp        WEBP_BUILD_DWEBP
     webp_js      WEBP_BUILD_WEBP_JS
     swap16bitcsp WEBP_ENABLE_SWAP_16BIT_CSP
     unicode      WEBP_UNICODE
)


if(VCPKG_TARGET_IS_LINUX)
    message("WebP currently requires the following library from the system package manager:\n    Xxf86vm\n\nThis can be installed on Ubuntu systems via apt-get install libxxf86vm-dev")
endif()

if(VCPKG_TARGET_IS_OSX)
    if("vwebp" IN_LIST FEATURES OR "extras" IN_LIST FEATURES)
        message(FATAL_ERROR "Due to GLUT Framework problems with CMake, at the moment it's not possible to build VWebP or extras on Mac!")
    endif()
endif()

vcpkg_configure_cmake(
  SOURCE_PATH ${SOURCE_PATH}
  PREFER_NINJA
  OPTIONS
    ${FEATURE_OPTIONS}
  OPTIONS_DEBUG
    -DCMAKE_DEBUG_POSTFIX=d
)

vcpkg_install_cmake()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)

vcpkg_copy_pdbs()
vcpkg_fixup_cmake_targets(CONFIG_PATH share/WebP/cmake TARGET_PATH share/webp) # find_package is called wit webp and not libwebp

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/share)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/share/WebP)

set(BIN_NAMES get_disto gif2webp img2webp vwebp vwebp_sdl webpinfo webpmux webp_quality cwebp dwebp)
file(MAKE_DIRECTORY "${CURRENT_PACKAGES_DIR}/tools/webp/")
foreach(tool ${BIN_NAMES})
  if(EXISTS "${CURRENT_PACKAGES_DIR}/debug/bin/${tool}${VCPKG_TARGET_EXECUTABLE_SUFFIX}")
    file(REMOVE "${CURRENT_PACKAGES_DIR}/debug/bin/${tool}${VCPKG_TARGET_EXECUTABLE_SUFFIX}")
  endif()

  if(EXISTS "${CURRENT_PACKAGES_DIR}/bin/${tool}${VCPKG_TARGET_EXECUTABLE_SUFFIX}")
    file(RENAME "${CURRENT_PACKAGES_DIR}/bin/${tool}${VCPKG_TARGET_EXECUTABLE_SUFFIX}" "${CURRENT_PACKAGES_DIR}/tools/webp/${tool}${VCPKG_TARGET_EXECUTABLE_SUFFIX}")
  endif()
endforeach()
vcpkg_copy_tool_dependencies("${CURRENT_PACKAGES_DIR}/tools/webp")

#No tools
file(GLOB_RECURSE RESULT "${CURRENT_PACKAGES_DIR}/tools/")
list(LENGTH RESULT RES_LEN)
if(RES_LEN EQUAL 0)
    file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/tools/")
endif()

if(VCPKG_LIBRARY_LINKAGE STREQUAL static)
  file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/bin" "${CURRENT_PACKAGES_DIR}/debug/bin")
endif()

file(INSTALL "${SOURCE_PATH}/COPYING" DESTINATION "${CURRENT_PACKAGES_DIR}/share/libwebp" RENAME copyright)
