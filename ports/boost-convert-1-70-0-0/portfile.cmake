# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/convert
    REF boost-1.70.0
    SHA512 0edc789070a74d7abf57170fddfc70f4b79b62720d771a650d148cefbf70b78e1a0a43a2fd85d5be94f4cb8452ec0ed33dfcbf0621a7980161de451576ab083e
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
