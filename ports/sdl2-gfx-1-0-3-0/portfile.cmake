# Common Ambient Variables:
#   VCPKG_ROOT_DIR = <C:\path\to\current\vcpkg>
#   TARGET_TRIPLET is the current triplet (x86-windows, etc)
#   PORT is the current port name (zlib, etc)
#   CURRENT_BUILDTREES_DIR = ${VCPKG_ROOT_DIR}\buildtrees\${PORT}
#   CURRENT_PACKAGES_DIR  = ${VCPKG_ROOT_DIR}\packages\${PORT}_${TARGET_TRIPLET}
#

include(vcpkg_common_functions)
set(SOURCE_PATH ${CURRENT_BUILDTREES_DIR}/src/SDL2_gfx-1.0.3)
vcpkg_download_distfile(ARCHIVE
    URLS "http://www.ferzkopp.net/Software/SDL2_gfx/SDL2_gfx-1.0.3.zip"
    FILENAME "SDL2_gfx-1.0.3.zip"
    SHA512 f68485f71acf979aba68f3575f260fbc95a59496a9639498bcff80ffbfdb157c82a44bb5a0b0e3b1e157376ea4ff2f196f50466e6f24d850f94cfe7c24b1a497
)
vcpkg_extract_source_archive(${ARCHIVE})
file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH})

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
)

vcpkg_install_cmake()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)

# Handle copyright
file(COPY ${SOURCE_PATH}/COPYING DESTINATION ${CURRENT_PACKAGES_DIR}/share/sdl2-gfx)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/sdl2-gfx/COPYING ${CURRENT_PACKAGES_DIR}/share/sdl2-gfx/copyright)

vcpkg_copy_pdbs()