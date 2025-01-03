include(vcpkg_common_functions)

set(IDN2_VERSION 2.0.5)
set(IDN2_FILENAME libidn2-${IDN2_VERSION}.tar.gz)
set(SOURCE_PATH ${CURRENT_BUILDTREES_DIR}/src/libidn2-${IDN2_VERSION})

vcpkg_download_distfile(ARCHIVE
    URLS "http://ftp.gnu.org/gnu/libidn/${IDN2_FILENAME}"
    FILENAME "${IDN2_FILENAME}"
    SHA512 9d040d60de40316788825d8720d509d5b8a82287415e09e17792c2f32fad99ca77f43e55888b9484db69426eaa0ece59e9671eee9cc46411afbdb0f81af31a79
)
vcpkg_extract_source_archive(${ARCHIVE})

file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH})
file(COPY ${CMAKE_CURRENT_LIST_DIR}/string.h DESTINATION ${SOURCE_PATH}/gl)

configure_file(${CMAKE_CURRENT_LIST_DIR}/config.h ${SOURCE_PATH})

function(simple_copy_template_header FILE_PATH BASE_NAME)
    if(NOT EXISTS ${FILE_PATH}/${BASE_NAME}.h)
       if(EXISTS ${FILE_PATH}/${BASE_NAME}.in.h)
           configure_file(${FILE_PATH}/${BASE_NAME}.in.h ${FILE_PATH}/${BASE_NAME}.h)
       endif()
    endif()
endfunction()

# There seems to be no difference between source and destination files after 'configure'
# apart from auto-generated notification at the top. So why not just do a simple copy.
simple_copy_template_header(${SOURCE_PATH}/unistring uniconv)
simple_copy_template_header(${SOURCE_PATH}/unistring unictype)
simple_copy_template_header(${SOURCE_PATH}/unistring uninorm)
simple_copy_template_header(${SOURCE_PATH}/unistring unistr)
simple_copy_template_header(${SOURCE_PATH}/unistring unitypes)
simple_copy_template_header(${SOURCE_PATH}/unistring alloca)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
)

vcpkg_install_cmake()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)

# License and man
file(INSTALL ${SOURCE_PATH}/COPYING DESTINATION ${CURRENT_PACKAGES_DIR}/share/libidn2 RENAME copyright)
file(INSTALL ${SOURCE_PATH}/doc/libidn2.pdf DESTINATION ${CURRENT_PACKAGES_DIR}/share/libidn2)

vcpkg_copy_pdbs()
