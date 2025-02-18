# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/vmd
    REF boost-1.69.0
    SHA512 d6b6a88a92849eb6c21aad27ee59e5a6d488524ea813cfa0fd9dc015b5c25e98da6ad97bd62d80d24d973b07b01ccf437f8b1d1f10b4e6aa7402ee8e594953c3
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
