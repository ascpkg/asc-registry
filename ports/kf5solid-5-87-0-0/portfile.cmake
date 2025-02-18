vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO KDE/solid
    REF v5.87.0
    SHA512 e1add78825841c8a87b006a2c1dba31fff7fff5a26af52379769a0851927edead2296aab240c95c11d4d866dfd08e63ee92619f44ea0b8b08a8cc1a827f31e9a
    HEAD_REF master
    PATCHES
        fix-libmount.patch
)

if(VCPKG_TARGET_IS_OSX)
    # On Darwin platform, the bundled version of 'bison' may be too old (< 3.0).
    vcpkg_find_acquire_program(BISON)
    execute_process(
        COMMAND ${BISON} --version
        OUTPUT_VARIABLE BISON_OUTPUT
    )
    string(REGEX MATCH "([0-9]+)\\.([0-9]+)\\.([0-9]+)" BISON_VERSION "${BISON_OUTPUT}")
    set(BISON_MAJOR ${CMAKE_MATCH_1})
    set(BISON_MINOR ${CMAKE_MATCH_2})
    message(STATUS "Using bison: ${BISON_MAJOR}.${BISON_MINOR}.${CMAKE_MATCH_3}")
    if(NOT (BISON_MAJOR GREATER_EQUAL 3 AND BISON_MINOR GREATER_EQUAL 0))
        message(WARNING "${PORT} requires bison version greater than one provided by macOS, please use \`brew install bison\` to install a newer bison.")
    endif()
endif()

vcpkg_find_acquire_program(BISON)
vcpkg_find_acquire_program(FLEX)

get_filename_component(FLEX_DIR "${FLEX}" DIRECTORY )
get_filename_component(BISON_DIR "${BISON}" DIRECTORY )

vcpkg_add_to_path(PREPEND "${FLEX_DIR}")
vcpkg_add_to_path(PREPEND "${BISON_DIR}")

# Prevent KDEClangFormat from writing to source effectively blocking parallel configure
file(WRITE ${SOURCE_PATH}/.clang-format "DisableFormat: true\nSortIncludes: false\n")

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
  INVERTED_FEATURES
    "libmount"          CMAKE_DISABLE_FIND_PACKAGE_LibMount
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBUILD_TESTING=OFF
        -DKDE_INSTALL_QMLDIR=qml
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME KF5Solid CONFIG_PATH lib/cmake/KF5Solid)
vcpkg_copy_pdbs()

vcpkg_copy_tools(
    TOOL_NAMES solid-hardware5
    AUTO_CLEAN
 )

if(VCPKG_LIBRARY_LINKAGE STREQUAL "static")
    file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/bin" "${CURRENT_PACKAGES_DIR}/debug/bin")
endif()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

file(INSTALL "${SOURCE_PATH}/LICENSES/" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}/copyright")

