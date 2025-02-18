vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO libimobiledevice-win32/ideviceinstaller
    REF ${VERSION}
    SHA512 d0801b3a38eb02206a6f06e05cc19b794c69a87c06895165f64522c61e07030046499c5f0e436981682f9e17f91eae87913cca091e2e039a74ee35a5136100d4
    HEAD_REF msvc-master
    PATCHES Add-missing-lib.patch
)

vcpkg_msbuild_install(
    SOURCE_PATH "${SOURCE_PATH}"
    PROJECT_SUBPATH ideviceinstaller.vcxproj
    DEPENDENT_PKGCONFIG libimobiledevice-1.0 libzip
    ADDITIONAL_LIBS getopt.lib
)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/COPYING")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
