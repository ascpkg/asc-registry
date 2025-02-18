#header-only library
include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Microsoft/wil
    REF 607e3c44797e18ae050907114601a31883489254
    SHA512 78d14f48a0d6629d72b6007e20ce4a14855667d0f9f8240b66a8cc135e079fca97926db6fc18852cd932f80b1b5a55c08cb48ca999fa9327f7e9c0586ea3ecc7
    HEAD_REF master
)

file(INSTALL ${SOURCE_PATH}/include DESTINATION ${CURRENT_PACKAGES_DIR})
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/wil RENAME copyright)