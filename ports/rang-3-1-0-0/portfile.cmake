include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO agauniyal/rang
    REF v3.1.0
    SHA512 3419c9d8b8177320d4254a3e317790b0ca17bb08940025a16cb6a468a5f4c6e6a8bae391441fbb61b46e94cbe760aef1cb7f31fb8a1e958312e9dcb568b04470
    HEAD_REF master
)

file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH})

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
)
vcpkg_install_cmake()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug)
file(COPY ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT})
file(RENAME ${CURRENT_PACKAGES_DIR}/share/${PORT}/LICENSE ${CURRENT_PACKAGES_DIR}/share/${PORT}/copyright)