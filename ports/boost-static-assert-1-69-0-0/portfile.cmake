# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/static_assert
    REF boost-1.69.0
    SHA512 66e7931bab7cf87ad70e463f7154714d88cccf45b32c40adb68ac3af386158220d148df26beb2fc2f111e5cbc443744e32572e8ef26f279c3e81634f0d18ecf6
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
