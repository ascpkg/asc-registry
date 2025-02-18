# Common Ambient Variables:
#   CURRENT_BUILDTREES_DIR    = ${VCPKG_ROOT_DIR}\buildtrees\${PORT}
#   CURRENT_PACKAGES_DIR      = ${VCPKG_ROOT_DIR}\packages\${PORT}_${TARGET_TRIPLET}
#   CURRENT_PORT_DIR          = ${VCPKG_ROOT_DIR}\ports\${PORT}
#   PORT                      = current port name (zlib, etc)
#   TARGET_TRIPLET            = current triplet (x86-windows, x64-windows-static, etc)
#   VCPKG_CRT_LINKAGE         = C runtime linkage type (static, dynamic)
#   VCPKG_LIBRARY_LINKAGE     = target library linkage type (static, dynamic)
#   VCPKG_ROOT_DIR            = <C:\path\to\current\vcpkg>
#   VCPKG_TARGET_ARCHITECTURE = target architecture (x64, x86, arm)
#

include(vcpkg_common_functions)
set(SOURCE_PATH ${CURRENT_BUILDTREES_DIR}/src/capstone)
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REF 3.0.5-rc3
    REPO "aquynh/capstone"
    SHA512 1327fc570fc2310f71c4d7329528c05e30b9ad68ea50254b9a8c4b3b113f5165c2e0474ec99bbe1e6e46f2820379f388e4c2082c156027e117d88a8f1908acfe
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA # Disable this option if project cannot be built with Ninja
    # OPTIONS -DUSE_THIS_IN_ALL_BUILDS=1 -DUSE_THIS_TOO=2
    # OPTIONS_RELEASE -DOPTIMIZE=1
    # OPTIONS_DEBUG -DDEBUGGABLE=1
    OPTIONS
        -DCAPSTONE_STATIC=ON
        -DCAPSTONE_BUILD_SHARED=OFF

        #-DCAPSTONE_ARCHS="x86"
        -DCAPSTONE_X86_SUPPORT=ON
        -DCAPSTONE_ARM_SUPPORT=OFF
        -DCAPSTONE_ARM64_SUPPORT=OFF
        -DCAPSTONE_MIPS_SUPPORT=OFF
        -DCAPSTONE_PPC_SUPPORT=OFF
        -DCAPSTONE_SPARC_SUPPORT=OFF
        -DCAPSTONE_SYSZ_SUPPORT=OFF
        -DCAPSTONE_XCORE_SUPPORT=OFF

        -DCAPSTONE_BUILD_TESTS=OFF
    OPTIONS_RELEASE
        -DCAPSTONE_BUILD_DIET=ON
        -DCAPSTONE_X86_REDUCE=ON
)

vcpkg_install_cmake()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)

# Handle copyright
file(INSTALL ${SOURCE_PATH}/LICENSE.txt 
    DESTINATION ${CURRENT_PACKAGES_DIR}/share/capstone 
    RENAME copyright)
