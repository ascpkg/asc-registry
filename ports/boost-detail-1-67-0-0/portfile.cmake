# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/detail
    REF boost-1.67.0
    SHA512 3746e61719cee4e7307677633edf170f8824b8fbd9aa7f159c9ff1feac662fc73f9a4bbe06fad9d9c5fbe356d6ec398d53223ddb7d85c01f906fe698f217f8b4
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
