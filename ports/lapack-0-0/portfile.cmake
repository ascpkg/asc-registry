SET(VCPKG_POLICY_EMPTY_PACKAGE enabled)
# Make sure LAPACK can be found
vcpkg_configure_cmake(SOURCE_PATH ${CURRENT_PORT_DIR})
