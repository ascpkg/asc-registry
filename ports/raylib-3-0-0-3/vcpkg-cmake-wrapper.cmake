include(SelectLibraryConfigurations)

find_path(RAYLIB_INCLUDE_DIR raylib.h)

find_library(RAYLIB_LIBRARY_DEBUG NAMES raylib libraylib NAMES_PER_DIR PATH_SUFFIXES lib PATHS "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/debug" NO_DEFAULT_PATH REQUIRED)
find_library(RAYLIB_LIBRARY_RELEASE NAMES raylib libraylib NAMES_PER_DIR PATH_SUFFIXES lib PATHS "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}" NO_DEFAULT_PATH REQUIRED)

select_library_configurations(RAYLIB)

set(RAYLIB_INCLUDE_DIRS ${RAYLIB_INCLUDE_DIR})
set(RAYLIB_LIBRARIES ${RAYLIB_LIBRARY})
