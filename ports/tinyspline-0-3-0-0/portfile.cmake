vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO msteinbeck/tinyspline
    REF v0.3.0
    SHA512 9B02ACA5C56341E8DDC057E2AEB78632695DAC3A4D2C628A43028E4216FC79942F68DD3105B1B92ACAE0D009109C56EC437AB638FB7334EBDD68543BE2D8D7F6
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DTINYSPLINE_BUILD_EXAMPLES=OFF
        -DTINYSPLINE_BUILD_TESTS=OFF
        -DTINYSPLINE_BUILD_DOCS=OFF
        -DTINYSPLINE_WARNINGS_AS_ERRORS=OFF
        -DTINYSPLINE_INSTALL_LIBRARY_DIR=lib
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/tinyspline DO_NOT_DELETE_PARENT_CONFIG_PATH)
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/tinysplinecxx)
vcpkg_fixup_pkgconfig()

if(VCPKG_LIBRARY_LINKAGE STREQUAL static)
    file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/bin" "${CURRENT_PACKAGES_DIR}/debug/bin")
endif()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
