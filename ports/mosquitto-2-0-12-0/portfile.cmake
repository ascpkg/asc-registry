vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO eclipse/mosquitto
    HEAD_REF master
    REF v2.0.12
    SHA512  bf502f4f8c5f8d9ae9ee6e6a417e3f9deea9933c69176903d460a1c91132658ebe093c8e9ed000cb579fe93f15626c15d8041ceb6438e15caca1d153a67975f9
    PATCHES
        0001-add-archive-destination-to-install.patch
        0002-win64-support.patch
        0003-add-find_package-libwebsockets.patch
        0004-support-static-build.patch
        0005-websocket-shared-lib-name.patch
)

string(COMPARE EQUAL "${VCPKG_LIBRARY_LINKAGE}" "static" STATIC_WEBSOCKETS)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS
        -DWITH_SRV=OFF
        -DWITH_WEBSOCKETS=ON
        -DSTATIC_WEBSOCKETS=${STATIC_WEBSOCKETS}
        -DWITH_TLS=ON
        -DWITH_TLS_PSK=ON
        -DWITH_THREADING=ON
        -DDOCUMENTATION=OFF
        -DWITH_PLUGINS=OFF
)

vcpkg_install_cmake()
vcpkg_copy_pdbs()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/share)

file(REMOVE ${CURRENT_PACKAGES_DIR}/debug/bin/mosquitto_passwd${VCPKG_TARGET_EXECUTABLE_SUFFIX})
file(REMOVE ${CURRENT_PACKAGES_DIR}/bin/mosquitto_passwd${VCPKG_TARGET_EXECUTABLE_SUFFIX})
file(REMOVE ${CURRENT_PACKAGES_DIR}/debug/bin/mosquitto_pub${VCPKG_TARGET_EXECUTABLE_SUFFIX})
file(REMOVE ${CURRENT_PACKAGES_DIR}/bin/mosquitto_pub${VCPKG_TARGET_EXECUTABLE_SUFFIX})
file(REMOVE ${CURRENT_PACKAGES_DIR}/debug/bin/mosquitto_rr${VCPKG_TARGET_EXECUTABLE_SUFFIX})
file(REMOVE ${CURRENT_PACKAGES_DIR}/bin/mosquitto_rr${VCPKG_TARGET_EXECUTABLE_SUFFIX})
file(REMOVE ${CURRENT_PACKAGES_DIR}/debug/bin/mosquitto_sub${VCPKG_TARGET_EXECUTABLE_SUFFIX})
file(REMOVE ${CURRENT_PACKAGES_DIR}/bin/mosquitto_sub${VCPKG_TARGET_EXECUTABLE_SUFFIX})

if(VCPKG_LIBRARY_LINKAGE STREQUAL "static")
    file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/bin ${CURRENT_PACKAGES_DIR}/debug/bin)
endif()

configure_file(${CMAKE_CURRENT_LIST_DIR}/vcpkg-cmake-wrapper.cmake ${CURRENT_PACKAGES_DIR}/share/${PORT}/vcpkg-cmake-wrapper.cmake @ONLY)
file(INSTALL ${CMAKE_CURRENT_LIST_DIR}/usage DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})

file(INSTALL ${SOURCE_PATH}/LICENSE.txt DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
