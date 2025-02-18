# LLVM documentation recommends always using static library linkage when
#   building with Microsoft toolchain; it's also the default on other platforms
set(VCPKG_LIBRARY_LINKAGE static)

include(vcpkg_common_functions)
set(SOURCE_PATH ${CURRENT_BUILDTREES_DIR}/src/llvm-5.0.0.src)
vcpkg_download_distfile(ARCHIVE
    URLS "http://releases.llvm.org/5.0.0/llvm-5.0.0.src.tar.xz"
    FILENAME "llvm-5.0.0.src.tar.xz"
    SHA512 e6d8fdcb5bf27bded814d02f39f69c6171bc3a512d5957c03e5ac2e231f903b7de87634b059bd5c5da670f7c3a8f7a538f6299225799f15f921857f1452f6b3a
)
vcpkg_extract_source_archive(${ARCHIVE})

vcpkg_download_distfile(CLANG_ARCHIVE
    URLS "http://releases.llvm.org/5.0.0/cfe-5.0.0.src.tar.xz"
    FILENAME "cfe-5.0.0.src.tar.xz"
    SHA512 14acdd622310122b544c952ee5b932b7006d9d8424319f0e3974f2503d40a0cec4200fdd3d813a32ce0d877bcfbb9a5bd5c36f6142b4330e6c814f113ca2efe8
)
vcpkg_extract_source_archive(${CLANG_ARCHIVE} ${SOURCE_PATH}/tools)

if(NOT EXISTS ${SOURCE_PATH}/tools/clang)
  file(RENAME ${SOURCE_PATH}/tools/cfe-5.0.0.src ${SOURCE_PATH}/tools/clang)
endif()

vcpkg_apply_patches(
    SOURCE_PATH ${SOURCE_PATH}
    PATCHES ${CMAKE_CURRENT_LIST_DIR}/install-cmake-modules-to-share.patch
)

vcpkg_find_acquire_program(PYTHON3)
get_filename_component(PYTHON3_DIR "${PYTHON3}" DIRECTORY)
set(ENV{PATH} "$ENV{PATH};${PYTHON3_DIR}")

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS
        -DLLVM_TARGETS_TO_BUILD=X86
        -DLLVM_INCLUDE_TOOLS=ON
        -DLLVM_INCLUDE_UTILS=OFF
        -DLLVM_INCLUDE_EXAMPLES=OFF
        -DLLVM_INCLUDE_TESTS=OFF
        -DLLVM_ABI_BREAKING_CHECKS=FORCE_OFF
        -DLLVM_TOOLS_INSTALL_DIR=tools/llvm
)

vcpkg_install_cmake()

file(GLOB EXE ${CURRENT_PACKAGES_DIR}/bin/*)
file(GLOB DEBUG_EXE ${CURRENT_PACKAGES_DIR}/debug/bin/*)
file(COPY ${EXE} DESTINATION ${CURRENT_PACKAGES_DIR}/tools)
file(COPY ${DEBUG_EXE} DESTINATION ${CURRENT_PACKAGES_DIR}/debug/tools)
file(REMOVE ${EXE})
file(REMOVE ${DEBUG_EXE})

file(GLOB CMAKECONFIG_DEBUG ${CURRENT_PACKAGES_DIR}/debug/lib/cmake/clang/*)
file(GLOB CMAKECONFIG ${CURRENT_PACKAGES_DIR}/lib/cmake/clang/*)
file(COPY ${CMAKECONFIG_DEBUG} DESTINATION ${CURRENT_PACKAGES_DIR}/share/clang)
file(COPY ${CMAKECONFIG} DESTINATION ${CURRENT_PACKAGES_DIR}/share/clang)

vcpkg_fixup_cmake_targets(CONFIG_PATH share/llvm)
vcpkg_copy_tool_dependencies(${CURRENT_PACKAGES_DIR}/tools/llvm)

file(REMOVE_RECURSE
    ${CURRENT_PACKAGES_DIR}/debug/include
    ${CURRENT_PACKAGES_DIR}/debug/tools
    ${CURRENT_PACKAGES_DIR}/debug/share
    ${CURRENT_PACKAGES_DIR}/debug/bin
    ${CURRENT_PACKAGES_DIR}/debug/lib/cmake
    ${CURRENT_PACKAGES_DIR}/debug/msbuild-bin
    ${CURRENT_PACKAGES_DIR}/bin
    ${CURRENT_PACKAGES_DIR}/lib/cmake
    ${CURRENT_PACKAGES_DIR}/msbuild-bin
    ${CURRENT_PACKAGES_DIR}/tools/msbuild-bin
)

# Remove one empty include subdirectory if it is indeed empty
file(GLOB MCANALYSISFILES ${CURRENT_PACKAGES_DIR}/include/llvm/MC/MCAnalysis/*)
if(NOT MCANALYSISFILES)
  file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/include/llvm/MC/MCAnalysis)
endif()

# Handle copyright
file(INSTALL ${SOURCE_PATH}/LICENSE.TXT DESTINATION ${CURRENT_PACKAGES_DIR}/share/llvm RENAME copyright)
