vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO martinmoene/optional-lite
    REF v3.5.0
    SHA512 E578D391BC95E2A5302B4B02E0B17659026B2743FC5C1E16CD83F6227FA9B5990FA3FA23E808A4EA0F5BDAFBF80834B0C462D563AB615907F113EE5A09AE88F5
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DOPTIONAL_LITE_OPT_BUILD_TESTS=OFF
        -DOPTIONAL_LITE_OPT_BUILD_EXAMPLES=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(
    CONFIG_PATH "lib/cmake/${PORT}"
)

file(REMOVE_RECURSE
    "${CURRENT_PACKAGES_DIR}/debug"
    "${CURRENT_PACKAGES_DIR}/lib"
)

file(INSTALL
    "${SOURCE_PATH}/LICENSE.txt" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright
)
