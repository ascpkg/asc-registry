include(vcpkg_common_functions)

set(OGRE_VERSION 1.10.9)
set(SOURCE_PATH ${CURRENT_BUILDTREES_DIR}/src/ogre-${OGRE_VERSION})

vcpkg_download_distfile(ARCHIVE
    URLS "https://github.com/OGRECave/ogre/archive/v${OGRE_VERSION}.zip"
    FILENAME "ogre-${OGRE_VERSION}.zip"
    SHA512 2e68b30da6dc2e1df6575970623a14057675b069536ed0ac87faeefc8e295965ff7427c99385f29ab803b02bd5294f6886293aabdd17ec8c92f80baf53587457
)
vcpkg_extract_source_archive(${ARCHIVE})

vcpkg_apply_patches(
    SOURCE_PATH ${SOURCE_PATH}
    PATCHES
        "${CMAKE_CURRENT_LIST_DIR}/001-cmake-install-dir.patch"
)

if (VCPKG_LIBRARY_LINKAGE STREQUAL static)
    set(OGRE_STATIC ON)
else()
    set(OGRE_STATIC OFF)
endif()

# Configure features

if("d3d9" IN_LIST FEATURES)
    set(WITH_D3D9 ON)
else()
    set(WITH_D3D9 OFF)
endif()

if("java" IN_LIST FEATURES)
    set(WITH_JAVA ON)
else()
    set(WITH_JAVA OFF)
endif()

if("python" IN_LIST FEATURES)
    set(WITH_PYTHON ON)
else()
    set(WITH_PYTHON OFF)
endif()

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS
        -DOGRE_BUILD_DEPENDENCIES=OFF
        -DOGRE_BUILD_SAMPLES=OFF
        -DOGRE_BUILD_TESTS=OFF
        -DOGRE_BUILD_TOOLS=OFF
        -DOGRE_BUILD_MSVC_MP=ON
        -DOGRE_BUILD_MSVC_ZM=ON
        -DOGRE_INSTALL_DEPENDENCIES=OFF
        -DOGRE_INSTALL_DOCS=OFF
        -DOGRE_INSTALL_PDB=OFF
        -DOGRE_INSTALL_SAMPLES=OFF
        -DOGRE_INSTALL_TOOLS=OFF
        -DOGRE_INSTALL_CMAKE=ON
        -DOGRE_INSTALL_VSPROPS=OFF
        -DOGRE_STATIC=${OGRE_STATIC}
        -DOGRE_UNITY_BUILD=OFF
        -DOGRE_USE_STD11=ON
        -DOGRE_CONFIG_THREAD_PROVIDER=std
        -DOGRE_NODE_STORAGE_LEGACY=OFF
        -DOGRE_BUILD_RENDERSYSTEM_D3D11=ON
        -DOGRE_BUILD_RENDERSYSTEM_GL=ON
        -DOGRE_BUILD_RENDERSYSTEM_GL3PLUS=ON
        -DOGRE_BUILD_RENDERSYSTEM_GLES=OFF
        -DOGRE_BUILD_RENDERSYSTEM_GLES2=OFF
# Optional stuff
        -DOGRE_BUILD_COMPONENT_JAVA=${WITH_JAVA}
        -DOGRE_BUILD_COMPONENT_PYTHON=${WITH_PYTHON}
        -DOGRE_BUILD_RENDERSYSTEM_D3D9=${WITH_D3D9}
# vcpkg specific stuff
        -DOGRE_CMAKE_DIR=share/ogre
)

vcpkg_install_cmake()

# Remove unwanted files
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)

vcpkg_fixup_cmake_targets(CONFIG_PATH share/ogre)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/share)

file(GLOB REL_CFGS ${CURRENT_PACKAGES_DIR}/bin/*.cfg)
file(COPY ${REL_CFGS} DESTINATION ${CURRENT_PACKAGES_DIR}/lib)

file(GLOB DBG_CFGS ${CURRENT_PACKAGES_DIR}/debug/bin/*.cfg)
file(COPY ${DBG_CFGS} DESTINATION ${CURRENT_PACKAGES_DIR}/debug/lib)

file(REMOVE ${REL_CFGS} ${DBG_CFGS})

if(VCPKG_LIBRARY_LINKAGE STREQUAL "static")
    file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/bin ${CURRENT_PACKAGES_DIR}/debug/bin)
endif()

# Handle copyright
file(INSTALL ${SOURCE_PATH}/COPYING DESTINATION ${CURRENT_PACKAGES_DIR}/share/ogre RENAME copyright)

vcpkg_copy_pdbs()
