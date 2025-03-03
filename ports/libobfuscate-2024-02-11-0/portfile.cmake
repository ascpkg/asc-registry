vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO adamyaxley/Obfuscate
  REF e65173d617983ce6b714c9ade5a6dbf3503c9a96
  SHA512 0fbe1cb3a65650aa05d15d57f7cd2b977133e0a11bb212b635b6c691b34a19a0e0502dc9a17b2f733fcfb3ec59030a0b18467ea44de914582061f298b90dd114
  HEAD_REF master
)

file(INSTALL ${SOURCE_PATH}/obfuscate.h DESTINATION ${CURRENT_PACKAGES_DIR}/include)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
