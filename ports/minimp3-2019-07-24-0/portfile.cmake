include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO lieff/minimp3
    REF 977514a6dfc4960d819a103f43b358e58ac6c28f #committed on Jul 24
    SHA512 9120cbd84a737e93d0c8d6d53a1b9b7af1fb4387b7b0756abbf9e0f41164a26a731e1e75ff6d02052c785357cdf8465ee92f04b6e9704f830086c3cf6808d2b8
    HEAD_REF master
)

file(COPY ${SOURCE_PATH}/minimp3.h DESTINATION ${CURRENT_PACKAGES_DIR}/include/${PORT})
file(COPY ${SOURCE_PATH}/minimp3_ex.h DESTINATION ${CURRENT_PACKAGES_DIR}/include/${PORT})

# Handle copyright
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT}/copyright)