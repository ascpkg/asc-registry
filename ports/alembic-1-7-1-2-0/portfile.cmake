include(vcpkg_common_functions)

if(VCPKG_LIBRARY_LINKAGE STREQUAL static)
    message(STATUS "Alembic does not support static linkage. Building dynamically.")
    set(VCPKG_LIBRARY_LINKAGE dynamic)
endif()

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO alembic/alembic
    REF 1.7.1
    SHA512 89e30b681a76eaf79b20ebeff62c495971b0eb64b28f249a14bbcf3bdb40df7eda93b0ede299dd5511bd4587a2cc2d4ebd851fb89bf999fdccc31fee3cffbba2
    HEAD_REF master
)

vcpkg_apply_patches(
    SOURCE_PATH ${SOURCE_PATH}
    PATCHES ${CMAKE_CURRENT_LIST_DIR}/fix-hdf5link.patch
)

SET(VCPKG_INSTALLED ${VCPKG_ROOT_DIR}/installed/${TARGET_TRIPLET})
vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS -DUSE_HDF5=ON
# work around for cmake-3.9 FindHDF5.cmake issue
# https://gitlab.kitware.com/cmake/cmake/issues/17039
    -DHDF5_FOUND=1
    -DHDF5_INCLUDE_DIRS=${VCPKG_INSTALLED}/include
    -DHDF5_LIBRARIES=${VCPKG_INSTALLED}/lib/hdf5.lib
)

vcpkg_install_cmake()

vcpkg_fixup_cmake_targets(CONFIG_PATH "lib/cmake/Alembic")

vcpkg_copy_pdbs()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/share)
file(GLOB EXE ${CURRENT_PACKAGES_DIR}/bin/*.exe)
file(GLOB DEBUG_EXE ${CURRENT_PACKAGES_DIR}/debug/bin/*.exe)
file(REMOVE ${EXE})
file(REMOVE ${DEBUG_EXE})
file(RENAME ${CURRENT_PACKAGES_DIR}/lib/Alembic.dll ${CURRENT_PACKAGES_DIR}/bin/Alembic.dll)
file(RENAME ${CURRENT_PACKAGES_DIR}/debug/lib/Alembic.dll ${CURRENT_PACKAGES_DIR}/debug/bin/Alembic.dll)

file(READ ${CURRENT_PACKAGES_DIR}/share/Alembic/AlembicTargets-debug.cmake DEBUG_CONFIG)
string(REPLACE "\${_IMPORT_PREFIX}/debug/lib/Alembic.dll"
               "\${_IMPORT_PREFIX}/debug/bin/Alembic.dll" DEBUG_CONFIG ${DEBUG_CONFIG})
file(WRITE ${CURRENT_PACKAGES_DIR}/share/Alembic/AlembicTargets-debug.cmake "${DEBUG_CONFIG}")

file(READ ${CURRENT_PACKAGES_DIR}/share/Alembic/AlembicTargets-release.cmake RELEASE_CONFIG)
string(REPLACE "\${_IMPORT_PREFIX}/lib/Alembic.dll"
               "\${_IMPORT_PREFIX}/bin/Alembic.dll" RELEASE_CONFIG ${RELEASE_CONFIG})
file(WRITE ${CURRENT_PACKAGES_DIR}/share/Alembic/AlembicTargets-release.cmake "${RELEASE_CONFIG}")

# Put the license file where vcpkg expects it
file(COPY ${SOURCE_PATH}/LICENSE.txt DESTINATION ${CURRENT_PACKAGES_DIR}/share/Alembic/)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/Alembic/LICENSE.txt ${CURRENT_PACKAGES_DIR}/share/Alembic/copyright)
