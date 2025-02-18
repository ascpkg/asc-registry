###

set(MAGNUM_HASH c8416ca4c3e9b68ba62acc9f73de235526cb3d6e)

include(vcpkg_common_functions)
set(SOURCE_PATH ${CURRENT_BUILDTREES_DIR}/src/magnum-${MAGNUM_HASH})
vcpkg_download_distfile(ARCHIVE
    URLS "https://github.com/mosra/magnum/archive/${MAGNUM_HASH}.zip"
    FILENAME "magnum-${MAGNUM_HASH}.zip"
    SHA512 1248efaba22568a753396192624690a478c69946cdbbffe83e34cb85d54ec65756b693e025bf477fc192e6fecce56dc1b68631e1a763986267b83d6530af6ef4
)
vcpkg_extract_source_archive(${ARCHIVE})

if(VCPKG_LIBRARY_LINKAGE STREQUAL static)
    set(BUILD_STATIC 1)
else()
    set(BUILD_STATIC 0)
endif()

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA # Disable this option if project cannot be built with Ninja
    OPTIONS -DWITH_SDL2APPLICATION=ON
    OPTIONS -DWITH_AUDIO=ON
    OPTIONS -DWITH_WAVAUDIOIMPORTER=ON
    OPTIONS -DBUILD_STATIC=${BUILD_STATIC}
)

vcpkg_install_cmake()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/share)

if(VCPKG_LIBRARY_LINKAGE STREQUAL static)
   file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/bin)
   file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/bin)
endif()

# Handle copyright
file(COPY ${SOURCE_PATH}/COPYING DESTINATION ${CURRENT_PACKAGES_DIR}/share/magnum)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/magnum/COPYING ${CURRENT_PACKAGES_DIR}/share/magnum/copyright)

vcpkg_copy_pdbs()