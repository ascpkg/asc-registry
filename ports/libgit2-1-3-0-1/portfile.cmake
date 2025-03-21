# libgit2 uses winapi functions not available in WindowsStore
vcpkg_fail_port_install(ON_TARGET "uwp")

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO libgit2/libgit2
    REF v1.3.0
    SHA512 842a648a67ff23ba9e6bf14b706ba9081164866e14000ebf3858442b7046925f05e1dbf00a7d740dc4bf32280e260730e23a9492e817094aa90736ae335ee76e
    HEAD_REF master
)

string(COMPARE EQUAL "${VCPKG_CRT_LINKAGE}" "static" STATIC_CRT)

set(REGEX_BACKEND OFF)
set(USE_HTTPS OFF)

function(set_regex_backend VALUE)
    if(REGEX_BACKEND)
        message(FATAL_ERROR "Only one regex backend (pcre,pcre2) is allowed")
    endif()
    set(REGEX_BACKEND ${VALUE} PARENT_SCOPE)
endfunction()

function(set_tls_backend VALUE)
    if(USE_HTTPS)
        message(FATAL_ERROR "Only one TLS backend (openssl,winhttp,sectransp,mbedtls) is allowed")
    endif()
    set(USE_HTTPS ${VALUE} PARENT_SCOPE)
endfunction()

foreach(GIT2_FEATURE ${FEATURES})
    if(GIT2_FEATURE STREQUAL "pcre")
        set_regex_backend("pcre")
    elseif(GIT2_FEATURE STREQUAL "pcre2")
        set_regex_backend("pcre2")
    elseif(GIT2_FEATURE STREQUAL "openssl")
        set_tls_backend("OpenSSL")
    elseif(GIT2_FEATURE STREQUAL "winhttp")
        if(NOT VCPKG_TARGET_IS_WINDOWS)
            message(FATAL_ERROR "winhttp is not supported on non-Windows and uwp platforms")
        endif()
        set_tls_backend("WinHTTP")
    elseif(GIT2_FEATURE STREQUAL "sectransp")
        if(NOT VCPKG_TARGET_IS_OSX)
            message(FATAL_ERROR "sectransp is not supported on non-Apple platforms")
        endif()
        set_tls_backend("SecureTransport")
    elseif(GIT2_FEATURE STREQUAL "mbedtls")
        if(VCPKG_TARGET_IS_WINDOWS)
            message(FATAL_ERROR "mbedtls is not supported on Windows because a certificate file must be specified at compile time")
        endif()
        set_tls_backend("mbedTLS")
    endif()
endforeach()

if(NOT REGEX_BACKEND)
    message(FATAL_ERROR "Must choose pcre or pcre2 regex backend")
endif()

vcpkg_check_features(
    OUT_FEATURE_OPTIONS GIT2_FEATURES
    FEATURES
        ssh USE_SSH
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBUILD_CLAR=OFF
        -DUSE_HTTP_PARSER=system
        -DUSE_HTTPS=${USE_HTTPS}
        -DREGEX_BACKEND=${REGEX_BACKEND}
        -DSTATIC_CRT=${STATIC_CRT}
        ${GIT2_FEATURES}
)

vcpkg_cmake_install()
vcpkg_fixup_pkgconfig()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(INSTALL "${SOURCE_PATH}/COPYING" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
