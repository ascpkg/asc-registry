_find_package(${ARGS})

if("@VCPKG_LIBRARY_LINKAGE@" STREQUAL "static")
    if(@ENABLE_ZLIB@)
        find_package(ZLIB REQUIRED)
        list(APPEND LibArchive_LIBRARIES ZLIB::ZLIB)
    endif()
    if(@ENABLE_BZip2@)
        find_package(BZip2 REQUIRED)
        list(APPEND LibArchive_LIBRARIES BZip2::BZip2)
    endif()
    if(@ENABLE_LIBXML2@)
        find_package(LibXml2 REQUIRED)
        list(APPEND LibArchive_LIBRARIES LibXml2::LibXml2)
    endif()
    if(@ENABLE_LZ4@)
        find_package(lz4 REQUIRED)
        list(APPEND LibArchive_LIBRARIES lz4::lz4)
    endif()
    if(@ENABLE_LZMA@)
        find_package(LibLZMA REQUIRED)
        list(APPEND LibArchive_LIBRARIES LibLZMA::LibLZMA)
    endif()
    if(@ENABLE_LZO@)
        find_library(LZO_LIBRARY_DEBUG NAMES lzo2d lzo2 NAMES_PER_DIR PATH_SUFFIXES lib PATHS "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/debug" NO_DEFAULT_PATH)
        find_library(LZO_LIBRARY_RELEASE NAMES lzo2 NAMES_PER_DIR PATH_SUFFIXES lib PATHS "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}" NO_DEFAULT_PATH)
        if(LZO_LIBRARY_RELEASE)
            list(APPEND LibArchive_LIBRARIES optimized ${LZO_LIBRARY_RELEASE})
        endif()
        if(LZO_LIBRARY_DEBUG)
            list(APPEND LibArchive_LIBRARIES debug ${LZO_LIBRARY_DEBUG})
        endif()
    endif()
    if(@ENABLE_ZSTD@)
        find_library(ZSTD_LIBRARY_DEBUG NAMES zstdd zstd NAMES_PER_DIR PATH_SUFFIXES lib PATHS "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/debug" NO_DEFAULT_PATH)
        find_library(ZSTD_LIBRARY_RELEASE NAMES zstd NAMES_PER_DIR PATH_SUFFIXES lib PATHS "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}" NO_DEFAULT_PATH)
        if(ZSTD_LIBRARY_RELEASE)
            list(APPEND LibArchive_LIBRARIES optimized ${ZSTD_LIBRARY_RELEASE})
        endif()
        if(ZSTD_LIBRARY_DEBUG)
            list(APPEND LibArchive_LIBRARIES debug ${ZSTD_LIBRARY_DEBUG})
        endif()
    endif()
    if(@ENABLE_OPENSSL@)
        find_package(OpenSSL REQUIRED)
        list(APPEND LibArchive_LIBRARIES OpenSSL::Crypto)
    endif()

    if(TARGET LibArchive::LibArchive)
        if(@ENABLE_BZip2@)
            target_link_libraries(LibArchive::LibArchive INTERFACE BZip2::BZip2)
        endif()
        if(@ENABLE_ZLIB@)
            target_link_libraries(LibArchive::LibArchive INTERFACE ZLIB::ZLIB)
        endif()
        if(@ENABLE_LIBXML2@)
            target_link_libraries(LibArchive::LibArchive INTERFACE LibXml2::LibXml2)
        endif()
        if(@ENABLE_LZ4@)
            target_link_libraries(LibArchive::LibArchive INTERFACE lz4::lz4)
        endif()
        if(@ENABLE_LZMA@)
            target_link_libraries(LibArchive::LibArchive INTERFACE LibLZMA::LibLZMA)
        endif()
        if(@ENABLE_LZO@)
            if(LZO_LIBRARY_RELEASE)
                list(APPEND interface_lib \$<\$<NOT:\$<CONFIG:DEBUG>>:${LZO_LIBRARY_RELEASE}>)
            endif()
            if(LZO_LIBRARY_DEBUG)
                list(APPEND interface_lib \$<\$<CONFIG:DEBUG>:${LZO_LIBRARY_DEBUG}>)
            endif()
            set_property(TARGET LibArchive::LibArchive APPEND PROPERTY INTERFACE_LINK_LIBRARIES ${interface_lib})
        endif()
        if(@ENABLE_ZSTD@)
            if(ZSTD_LIBRARY_RELEASE)
                list(APPEND interface_lib \$<\$<NOT:\$<CONFIG:DEBUG>>:${ZSTD_LIBRARY_RELEASE}>)
            endif()
            if(ZSTD_LIBRARY_DEBUG)
                list(APPEND interface_lib \$<\$<CONFIG:DEBUG>:${ZSTD_LIBRARY_DEBUG}>)
            endif()
            set_property(TARGET LibArchive::LibArchive APPEND PROPERTY INTERFACE_LINK_LIBRARIES ${interface_lib})
        endif()
        if(@ENABLE_OPENSSL@)
            target_link_libraries(LibArchive::LibArchive INTERFACE OpenSSL::Crypto)
        endif()
    endif()
endif()


# TODO in some future
# if(@ENABLE_PCREPOSIX@)
# endif()
# if(@ENABLE_NETTLE@)
# endif()
# if(@ENABLE_EXPAT@)
# endif()
# if(@ENABLE_LibGCC@)
# endif()
# if(@ENABLE_CNG@)
# endif()
# if(@ENABLE_TAR@)
# endif()
# if(@ENABLE_CPIO@)
# endif()
# if(@ENABLE_CAT@)
# endif()
# if(@ENABLE_XATTR@)
# endif()
# if(@ENABLE_ACL@)
# endif()
# if(@ENABLE_ICONV@)
# endif()
