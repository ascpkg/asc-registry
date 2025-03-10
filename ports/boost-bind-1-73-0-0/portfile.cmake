# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/bind
    REF boost-1.73.0
    SHA512 5ec2535ac4452edbc10faf2d16e61ee09b12d6dc9d013015798c67bfdd5308e219e534aeae56549a5890aff70956573f5e4633a8261472e242de3314f027d563
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
