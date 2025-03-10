include(vcpkg_common_functions)

if(VCPKG_LIBRARY_LINKAGE STREQUAL static)
    message(STATUS "ANGLE currently only supports being built as a dynamic library")
    set(VCPKG_LIBRARY_LINKAGE dynamic)
endif()

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO google/angle
    REF 8d471f907d8d4ec1d46bc9366493bd76c11c1870 
    SHA512 b9235d2a98330bc8533c3fe871129e7235c680420eac16610eae4ca7224c5284313ab6377f30ddfb8a2da39b69f3ef0d16023fe1e7cec3fc2198f4eb4bdccb26
    HEAD_REF master
)

if(NOT TARGET_TRIPLET MATCHES "uwp")
	file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH})
else()
	file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeListsUwp.txt DESTINATION ${SOURCE_PATH})
	file(RENAME ${SOURCE_PATH}/CMakeListsUwp.txt ${SOURCE_PATH}/CMakeLists.txt)
	vcpkg_apply_patches(
		SOURCE_PATH ${SOURCE_PATH}
		PATCHES ${CMAKE_CURRENT_LIST_DIR}/001-fix-uwp.patch
		)
endif()

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS_DEBUG -DDISABLE_INSTALL_HEADERS=1
)

vcpkg_install_cmake()
vcpkg_copy_pdbs()

file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/angle RENAME copyright)
