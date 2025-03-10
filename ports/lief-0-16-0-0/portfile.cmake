vcpkg_download_distfile(
    FIX_FMT_V11_JOIN_LINUX_INCLUDE_MEMORY_PATCH
    URLS https://github.com/lief-project/LIEF/commit/41166332a2435fdb7d2bdc5c73f9ff9b442c5459.patch?full_index=1
    FILENAME fix-fmt-v11-join-linux-include-memory-41166332a2435fdb7d2bdc5c73f9ff9b442c5459.patch
    SHA512 14d5f7380352bd340c16447905b8185dbd2d977c8ba245e01d982fe7fbbdffb71004b9d4fdd732bc13e71a11aa3f46a4822cdeb2277e2cec6b841492d0de5606
)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO lief-project/LIEF
    REF ${VERSION}
    SHA512 7df75fab6c7023e37a6a4d27fac8dcb4200e0235625fc5952bb23cedb2e582a37fb67ee471c1ae953c0b205fd9cca5538a835f65ef80a771f72dc7ff68000ed9
    HEAD_REF master
    PATCHES
        fix-cmakelists.patch
        fix-liefconfig-cmake-in.patch
        fix-vcpkg-includes.patch
        "${FIX_FMT_V11_JOIN_LINUX_INCLUDE_MEMORY_PATCH}"
)

file(REMOVE_RECURSE "${SOURCE_PATH}/third-party")

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        "c-api"          LIEF_C_API             # C API
        "enable-json"    LIEF_ENABLE_JSON       # Enable JSON-related APIs
        "extra-warnings" LIEF_EXTRA_WARNINGS    # Enable extra warning from the compiler
        "logging"        LIEF_LOGGING           # Enable logging
        "logging-debug"  LIEF_LOGGING_DEBUG     # Enable debug logging

        "use-ccache"     LIEF_USE_CCACHE        # Use ccache to speed up compilation

        "elf"            LIEF_ELF               # Build LIEF with ELF module
        "pe"             LIEF_PE                # Build LIEF with PE  module
        "macho"          LIEF_MACHO             # Build LIEF with MachO module

        "oat"            LIEF_OAT               # Build LIEF with OAT module
        "dex"            LIEF_DEX               # Build LIEF with DEX module
        "vdex"           LIEF_VDEX              # Build LIEF with VDEX module
        "art"            LIEF_ART               # Build LIEF with ART module
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        ${FEATURE_OPTIONS}
        -DLIEF_EXAMPLES=OFF

        # Build with external vcpkg dependencies
        -DLIEF_OPT_MBEDTLS_EXTERNAL=ON
        -DLIEF_EXTERNAL_SPDLOG=ON
        -DLIEF_OPT_NLOHMANN_JSON_EXTERNAL=ON
        -DLIEF_OPT_FROZEN_EXTERNAL=ON
        -DLIEF_OPT_EXTERNAL_SPAN=ON
        -DLIEF_OPT_UTFCPP_EXTERNAL=ON
        -DLIEF_OPT_EXTERNAL_EXPECTED=ON
        -DLIEF_DISABLE_FROZEN=OFF
        -DLIEF_DISABLE_EXCEPTIONS=OFF

        "-DLIEF_EXTERNAL_SPAN_DIR=${_VCPKG_INSTALLED_DIR}/${TARGET_TRIPLET}/include/tcb"
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(CONFIG_PATH "lib/cmake/LIEF")

vcpkg_replace_string("${CURRENT_PACKAGES_DIR}/share/lief/LIEFConfig.cmake"
    [[include("${LIEF_${lib_type}_export}")]]
    [[include("${CMAKE_CURRENT_LIST_DIR}/LIEFExport-${lib_type}.cmake")]]
)

vcpkg_fixup_pkgconfig()

file(REMOVE_RECURSE
    "${CURRENT_PACKAGES_DIR}/debug/include"
    "${CURRENT_PACKAGES_DIR}/debug/share"
)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
