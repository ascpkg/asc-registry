_find_package(${ARGS})

if(@USE_ZLIB@)
    find_package(ZLIB)
endif()

if(@USE_BZIP2@)
    find_package(BZip2)
endif()

if(@USE_PNG@)
    find_package(PNG)
endif()

if(@USE_BROTLI@)
    find_library(BROTLIDEC_LIBRARY_RELEASE NAMES brotlidec brotlidec-static PATHS "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}" PATH_SUFFIXES lib NO_DEFAULT_PATH)
    find_library(BROTLIDEC_LIBRARY_DEBUG NAMES brotlidec brotlidec-static brotlidecd brotlidec-staticd PATHS "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/debug" PATH_SUFFIXES lib NO_DEFAULT_PATH)
    find_library(BROTLICOMMON_LIBRARY_RELEASE NAMES brotlicommon brotlicommon-static PATHS "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}" PATH_SUFFIXES lib NO_DEFAULT_PATH)
    find_library(BROTLICOMMON_LIBRARY_DEBUG NAMES brotlicommon brotlicommon-static brotlicommond brotlicommon-staticd PATHS "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/debug" PATH_SUFFIXES lib NO_DEFAULT_PATH)
    include(SelectLibraryConfigurations)
    select_library_configurations(BROTLIDEC)
    select_library_configurations(BROTLICOMMON)
endif(@USE_BROTLI@)

if(TARGET Freetype::Freetype)
    if(@USE_ZLIB@)
        set_property(TARGET Freetype::Freetype APPEND PROPERTY INTERFACE_LINK_LIBRARIES ZLIB::ZLIB)
    endif()

    if(@USE_BZIP2@)
        set_property(TARGET Freetype::Freetype APPEND PROPERTY INTERFACE_LINK_LIBRARIES BZip2::BZip2)
    endif()

    if(@USE_PNG@)
        set_property(TARGET Freetype::Freetype APPEND PROPERTY INTERFACE_LINK_LIBRARIES PNG::PNG)
    endif()

    if(@USE_BROTLI@)
        target_link_libraries(Freetype::Freetype INTERFACE ${BROTLIDEC_LIBRARIES} ${BROTLICOMMON_LIBRARIES})
    endif()
endif()

if(FREETYPE_LIBRARIES)
    if(@USE_ZLIB@)
        list(APPEND FREETYPE_LIBRARIES ${ZLIB_LIBRARIES})
    endif()

    if(@USE_BZIP2@)
        list(APPEND FREETYPE_LIBRARIES ${BZIP2_LIBRARIES})
    endif()

    if(@USE_PNG@)
        list(APPEND FREETYPE_LIBRARIES ${PNG_LIBRARIES})
    endif()

    if(@USE_BROTLI@)
        list(APPEND FREETYPE_LIBRARIES ${BROTLIDEC_LIBRARIES} ${BROTLICOMMON_LIBRARIES})
    endif()
endif()
