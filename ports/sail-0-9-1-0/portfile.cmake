vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO HappySeaFox/sail
    REF "v${VERSION}"
    SHA512 c8cface60031c5e84b99eaedb216f9e3af0354d24f5db7d6d0ec1f97d593ae46cb13c86bc244b6b8673cddfecf829a8b7738fdde8620472c12e95a5b61495133
    HEAD_REF master
)

# Enable selected codecs
set(ONLY_CODECS "")

foreach(CODEC avif bmp gif ico jpeg jpeg2000 jpegxl pcx png psd qoi svg tga tiff wal webp xbm)
    if (${CODEC} IN_LIST FEATURES)
        list(APPEND ONLY_CODECS ${CODEC})
    endif()
endforeach()

list(JOIN ONLY_CODECS "\;" ONLY_CODECS_ESCAPED)

# Enable OpenMP
if ("openmp" IN_LIST FEATURES)
    set(SAIL_ENABLE_OPENMP ON)
endif()

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBUILD_TESTING=OFF
        -DSAIL_COMBINE_CODECS=ON
        -DSAIL_ENABLE_OPENMP=${SAIL_ENABLE_OPENMP}
        -DSAIL_ONLY_CODECS=${ONLY_CODECS_ESCAPED}
        -DSAIL_BUILD_APPS=OFF
        -DSAIL_BUILD_EXAMPLES=OFF
)

vcpkg_cmake_install()

vcpkg_copy_pdbs()

# Remove duplicate files
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include"
                    "${CURRENT_PACKAGES_DIR}/debug/share")

# Move cmake configs
vcpkg_cmake_config_fixup(PACKAGE_NAME sail       CONFIG_PATH lib/cmake/sail       DO_NOT_DELETE_PARENT_CONFIG_PATH)
vcpkg_cmake_config_fixup(PACKAGE_NAME sailcodecs CONFIG_PATH lib/cmake/sailcodecs DO_NOT_DELETE_PARENT_CONFIG_PATH)
vcpkg_cmake_config_fixup(PACKAGE_NAME sailcommon CONFIG_PATH lib/cmake/sailcommon DO_NOT_DELETE_PARENT_CONFIG_PATH)
vcpkg_cmake_config_fixup(PACKAGE_NAME sailc++    CONFIG_PATH lib/cmake/sailc++    DO_NOT_DELETE_PARENT_CONFIG_PATH)
vcpkg_cmake_config_fixup(PACKAGE_NAME sailmanip  CONFIG_PATH lib/cmake/sailmanip  DO_NOT_DELETE_PARENT_CONFIG_PATH)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/lib/cmake"
                    "${CURRENT_PACKAGES_DIR}/debug/lib/cmake")


# Fix pkg-config files
vcpkg_fixup_pkgconfig()

# Unused because SAIL_COMBINE_CODECS is ON
vcpkg_replace_string("${CURRENT_PACKAGES_DIR}/include/sail/sail-common/config.h" "#define SAIL_CODECS_PATH \"${CURRENT_PACKAGES_DIR}/lib/sail/codecs\"" "")

# Handle usage
file(COPY "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")

# Handle copyright
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
