vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO libimobiledevice-win32/usbmuxd
    REF f1329e742825c93fd080bdb8253d710ef8b6f751 # v1.2.235
    SHA512 3259040a3266ce068a6fa1fdecdea824d22f04391ca073fc61d72a1f6d401d93469b9681ddc89a8016ef410bb7443875b2c5df2b571227dd34c66248cbe87fe7
    HEAD_REF master-msvc
    PATCHES
        fix-dependence-pthreads.patch
        fix-definitions.patch
)

vcpkg_msbuild_install(
    SOURCE_PATH "${SOURCE_PATH}"
    PROJECT_SUBPATH usbmuxd.vcxproj
    DEPENDENT_PKGCONFIG libimobiledevice-1.0
    ADDITIONAL_LIBS getopt.lib
)

# No headers
set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/COPYING.GPLv2")
