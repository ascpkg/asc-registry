# Give the CMake module a little bit of help to find the debug libraries
find_library(PostgreSQL_LIBRARY_DEBUG
NAMES pq
PATHS
  "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/debug/lib"
NO_DEFAULT_PATH
)
_find_package(${ARGS})
if(PostgreSQL_FOUND AND @USE_DL@)
    find_library(PostgreSQL_DL_LIBRARY NAMES dl)
    if(PostgreSQL_DL_LIBRARY)
        list(APPEND PostgreSQL_LIBRARIES "dl")
        if(TARGET PostgreSQL::PostgreSQL)
            set_property(TARGET PostgreSQL::PostgreSQL APPEND PROPERTY INTERFACE_LINK_LIBRARIES "dl")
        endif()
    endif()
endif()
if(PostgreSQL_FOUND AND "@VCPKG_LIBRARY_LINKAGE@" STREQUAL "static")
    include(SelectLibraryConfigurations)
    foreach(LIB_ITEM libpgport libpgcommon pgport pgcommon)
        find_library(PostgreSQL_${LIB_ITEM}_LIBRARY_RELEASE
            NAMES ${LIB_ITEM}
            PATHS "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/lib" NO_DEFAULT_PATH
        )
        if(TARGET PostgreSQL::PostgreSQL AND PostgreSQL_${LIB_ITEM}_LIBRARY_RELEASE)
            set_property(
                TARGET PostgreSQL::PostgreSQL
                APPEND PROPERTY INTERFACE_LINK_LIBRARIES "\$<\$<NOT:\$<CONFIG:DEBUG>>:${PostgreSQL_${LIB_ITEM}_LIBRARY_RELEASE}>"
            )
        endif()
        
        find_library(PostgreSQL_${LIB_ITEM}_LIBRARY_DEBUG
            NAMES ${LIB_ITEM}
            PATHS "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/debug/lib" NO_DEFAULT_PATH
        )
        if(TARGET PostgreSQL::PostgreSQL AND PostgreSQL_${LIB_ITEM}_LIBRARY_DEBUG)
            set_property(
                TARGET PostgreSQL::PostgreSQL
                APPEND PROPERTY INTERFACE_LINK_LIBRARIES "\$<\$<CONFIG:DEBUG>:${PostgreSQL_${LIB_ITEM}_LIBRARY_DEBUG}>"
            )
        endif()
        
        if (PostgreSQL_${LIB_ITEM}_LIBRARY_RELEASE OR PostgreSQL_${LIB_ITEM}_LIBRARY_DEBUG)
            select_library_configurations(PostgreSQL_${LIB_ITEM})
            list(APPEND PostgreSQL_LIBRARIES ${PostgreSQL_${LIB_ITEM}_LIBRARY})
        endif()
    endforeach()
endif()
