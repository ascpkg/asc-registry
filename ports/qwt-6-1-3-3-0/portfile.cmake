include(vcpkg_common_functions)
set(SOURCE_PATH ${CURRENT_BUILDTREES_DIR}/src/qwt-6.1.3)
vcpkg_download_distfile(ARCHIVE
    URLS "https://sourceforge.net/projects/qwt/files/qwt/6.1.3/qwt-6.1.3.zip"
    FILENAME "qwt-6.1.3.zip"
    SHA512 8f249e23d50f71d14fca37776ea40d8d6931db14d9602e03a343bfb7a9bf55502202103135b77f583c3890a7924220e8a142a01c448dbde311860d89a3b10fc8
)
vcpkg_extract_source_archive(${ARCHIVE})

if(VCPKG_LIBRARY_LINKAGE STREQUAL dynamic)
    vcpkg_apply_patches(
        SOURCE_PATH ${SOURCE_PATH}
        PATCHES "${CMAKE_CURRENT_LIST_DIR}/build-shared-lib.patch"
        QUIET
    )
else()
    vcpkg_apply_patches(
        SOURCE_PATH ${SOURCE_PATH}
        PATCHES "${CMAKE_CURRENT_LIST_DIR}/build-static-lib.patch"
        QUIET
    )
endif()

# The qwt build requires zlib1.dll
SET(ENV{PATH} "$ENV{PATH};${CURRENT_INSTALLED_DIR}/bin;${CURRENT_INSTALLED_DIR}/debug/bin")

#Store build paths
set(DEBUG_DIR "${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-dbg")
set(RELEASE_DIR "${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-rel")

file(REMOVE_RECURSE "${DEBUG_DIR}" "${RELEASE_DIR}")

#Configure debug
vcpkg_configure_qmake_debug(
    SOURCE_PATH ${SOURCE_PATH}
)

#First generate the makefiles so we can modify them
vcpkg_build_qmake_debug(TARGETS qmake_all)

#Store debug makefiles path
file(GLOB_RECURSE DEBUG_MAKEFILES ${DEBUG_DIR}/*Makefile*)

foreach(DEBUG_MAKEFILE ${DEBUG_MAKEFILES})
    file(READ "${DEBUG_MAKEFILE}" _contents)
    string(REPLACE "zlib.lib" "zlibd.lib" _contents "${_contents}")
    string(REPLACE "installed\\${TARGET_TRIPLET}\\lib" "installed\\${TARGET_TRIPLET}\\debug\\lib" _contents "${_contents}")
    string(REPLACE "/LIBPATH:${NATIVE_INSTALLED_DIR}\\debug\\lib qtmaind.lib" "shell32.lib /LIBPATH:${NATIVE_INSTALLED_DIR}\\debug\\lib\\manual-link qtmaind.lib /LIBPATH:${NATIVE_INSTALLED_DIR}\\debug\\lib" _contents "${_contents}")
    file(WRITE "${DEBUG_MAKEFILE}" "${_contents}")
endforeach()

#Build debug
vcpkg_build_qmake_debug(TARGETS sub-src-debug_ordered)

#Configure release
vcpkg_configure_qmake_release(
    SOURCE_PATH ${SOURCE_PATH}
)

#First generate the makefiles so we can modify them
vcpkg_build_qmake_release(TARGETS qmake_all)

#Store release makefile path
file(GLOB_RECURSE RELEASE_MAKEFILES ${RELEASE_DIR}/*Makefile*)

foreach(RELEASE_MAKEFILE ${RELEASE_MAKEFILES})
    file(READ "${RELEASE_MAKEFILE}" _contents)
    string(REPLACE "/LIBPATH:${NATIVE_INSTALLED_DIR}\\lib qtmain.lib" "shell32.lib /LIBPATH:${NATIVE_INSTALLED_DIR}\\lib\\manual-link qtmain.lib /LIBPATH:${NATIVE_INSTALLED_DIR}\\lib" _contents "${_contents}")
    file(WRITE "${RELEASE_MAKEFILE}" "${_contents}")
endforeach()

#Build release
vcpkg_build_qmake_release(TARGETS sub-src-release_ordered)

#Set the correct install directory to packages
foreach(MAKEFILE ${RELEASE_MAKEFILES} ${DEBUG_MAKEFILES})
    vcpkg_replace_string(${MAKEFILE} "(INSTALL_ROOT)${INSTALLED_DIR_WITHOUT_DRIVE}" "(INSTALL_ROOT)${PACKAGES_DIR_WITHOUT_DRIVE}")
endforeach()

#Install the header files
file(GLOB HEADER_FILES ${SOURCE_PATH}/src/*.h)
file(INSTALL ${HEADER_FILES} DESTINATION ${CURRENT_PACKAGES_DIR}/include/qwt)

#Install the module files
file(INSTALL
    ${RELEASE_DIR}/lib/qwt.lib
    DESTINATION ${CURRENT_PACKAGES_DIR}/lib
)

file(INSTALL
    ${DEBUG_DIR}/lib/qwtd.lib
    DESTINATION ${CURRENT_PACKAGES_DIR}/debug/lib
)

if(VCPKG_LIBRARY_LINKAGE STREQUAL dynamic)
    file(INSTALL
        ${RELEASE_DIR}/lib/qwt.dll
        DESTINATION ${CURRENT_PACKAGES_DIR}/bin
    )

    file(INSTALL
        ${DEBUG_DIR}/lib/qwtd.dll
        ${DEBUG_DIR}/lib/qwtd.pdb
        DESTINATION ${CURRENT_PACKAGES_DIR}/debug/bin
    )
endif()

# Handle copyright
file(COPY ${SOURCE_PATH}/COPYING DESTINATION ${CURRENT_PACKAGES_DIR}/share/qwt)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/qwt/COPYING ${CURRENT_PACKAGES_DIR}/share/qwt/copyright)
