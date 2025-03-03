vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO martinmoene/lest
    REF "v${VERSION}"
    SHA512 c45501b3876031205aa9a8e5264d61e545ecf827ce33b2f20fdc635345b6a4780a94334d2ddddce1bc708a8849cdba8dc3a73b045de81d6b32083be9036a7ff6
)

file(INSTALL ${SOURCE_PATH}/include/ DESTINATION ${CURRENT_PACKAGES_DIR}/include)
file(INSTALL ${SOURCE_PATH}/LICENSE.txt DESTINATION ${CURRENT_PACKAGES_DIR}/share/lest RENAME copyright)
