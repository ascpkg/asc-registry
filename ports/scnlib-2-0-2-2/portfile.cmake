vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_download_distfile(PATCH_20240406_1_97baaf2
    URLS https://github.com/eliaskosunen/scnlib/commit/97baaf2a0bbf235ba91e29fe7ac16abe528da2d2.patch?full_index=1
    SHA512 39c31d4bcac95a9ca614c0e39159f740a9819a2186d05cc5112178ab3e186cb5ca342438479b7e2267cea620d3042dc306d50c6c032572dbc2ad496bf85b7776
    FILENAME 97baaf2a0bbf235ba91e29fe7ac16abe528da2d2.patch
)
vcpkg_download_distfile(PATCH_20240406_2_5c4b91e
    URLS https://github.com/eliaskosunen/scnlib/commit/5c4b91ef1e2bbc29420e37b655bd8194afa19efc.patch?full_index=1
    SHA512 8af9695729ab906066aa7db16733796e45f824c7711ca72a13273438c510bed38d7fb2884861e70d1178f67c8b0e8ff4d0bff9a16ba434becb60a87dcb6269b5
    FILENAME 5c4b91ef1e2bbc29420e37b655bd8194afa19efc.patch
)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO eliaskosunen/scnlib
    REF "v${VERSION}"
    SHA512 12b9ae26a5ccc600aacad1e2b2287bfc0b6986a260e182c91541876bc5804fe661093ad10d1befda56803afc7a9aa9f0348820dbb5af4fa6fdf048f85b3bcef1
    HEAD_REF master
    PATCHES
        fix-SCN_HAS_STD_REGEX_MULTILINE-marco.patch
        "${PATCH_20240406_1_97baaf2}"
        "${PATCH_20240406_2_5c4b91e}"
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
      -DSCN_TESTS=OFF 
      -DSCN_EXAMPLES=OFF
      -DSCN_BENCHMARKS=OFF
      -DSCN_DOCS=OFF
      -DSCN_USE_EXTERNAL_SIMDUTF=ON
      -DSCN_USE_EXTERNAL_FAST_FLOAT=ON
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/scn)

file(REMOVE_RECURSE 
    "${CURRENT_PACKAGES_DIR}/debug/include"
    "${CURRENT_PACKAGES_DIR}/debug/share"
    "${CURRENT_PACKAGES_DIR}/share/scn"
)

file(INSTALL "${SOURCE_PATH}/LICENSE"
    DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
    RENAME copyright)
