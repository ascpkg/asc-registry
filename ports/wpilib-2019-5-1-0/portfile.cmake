include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO wpilibsuite/allwpilib
    REF 3dfb01d45b971ffdfeea50ce58653eff592807d9
    SHA512 188923cbe166f5812a24a06d8af56bda289aaed38231d45583d423e51e9cd23bb257ade02fdc26e8d0fdd6cdcb793282c04ac80ebad76f29fdbd0a3c1a10f05c
)

set(WITHOUT_JAVA ON)
set(WITHOUT_CSCORE ON)
set(WITHOUT_ALLWPILIB ON)

if ("cameraserver" IN_LIST FEATURES)
  set(WITHOUT_CSCORE OFF)
endif()

if ("allwpilib" IN_LIST FEATURES)
  set(WITHOUT_ALLWPILIB OFF)
endif()

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA

    OPTIONS
      -DWITHOUT_JAVA=${WITHOUT_JAVA}
      -DWITHOUT_CSCORE=${WITHOUT_CSCORE}
      -DWITHOUT_ALLWPILIB=${WITHOUT_ALLWPILIB}
      -DUSE_VCPKG_LIBUV=ON
      -DFLAT_INSTALL_WPILIB=ON
)
vcpkg_install_cmake()

file(COPY ${CURRENT_PACKAGES_DIR}/wpilib/include/ntcore/ DESTINATION ${CURRENT_PACKAGES_DIR}/include)
file(COPY ${CURRENT_PACKAGES_DIR}/wpilib/include/wpiutil/ DESTINATION ${CURRENT_PACKAGES_DIR}/include)
if (NOT WITHOUT_ALLWPILIB)
file(COPY ${CURRENT_PACKAGES_DIR}/wpilib/include/wpilibc/ DESTINATION ${CURRENT_PACKAGES_DIR}/include)
file(COPY ${CURRENT_PACKAGES_DIR}/wpilib/include/hal/gen/ DESTINATION ${CURRENT_PACKAGES_DIR}/include)
file(COPY ${CURRENT_PACKAGES_DIR}/wpilib/include/hal/ DESTINATION ${CURRENT_PACKAGES_DIR}/include)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/include/gen)
endif()
if (NOT WITHOUT_CSCORE)
file(COPY ${CURRENT_PACKAGES_DIR}/wpilib/include/cameraserver/ DESTINATION ${CURRENT_PACKAGES_DIR}/include)
file(COPY ${CURRENT_PACKAGES_DIR}/wpilib/include/cscore/ DESTINATION ${CURRENT_PACKAGES_DIR}/include)
endif()

if(NOT VCPKG_LIBRARY_LINKAGE STREQUAL "static")
  file(COPY ${CURRENT_PACKAGES_DIR}/wpilib/lib/ DESTINATION ${CURRENT_PACKAGES_DIR}/bin FILES_MATCHING PATTERN "*.dll")
  file(COPY ${CURRENT_PACKAGES_DIR}/debug/wpilib/lib/ DESTINATION ${CURRENT_PACKAGES_DIR}/debug/bin FILES_MATCHING PATTERN "*.dll")

  file(COPY ${CURRENT_PACKAGES_DIR}/wpilib/lib/ DESTINATION ${CURRENT_PACKAGES_DIR}/bin FILES_MATCHING PATTERN "*.so")
  file(COPY ${CURRENT_PACKAGES_DIR}/debug/wpilib/lib/ DESTINATION ${CURRENT_PACKAGES_DIR}/debug/bin FILES_MATCHING PATTERN "*.so")

  file(COPY ${CURRENT_PACKAGES_DIR}/wpilib/lib/ DESTINATION ${CURRENT_PACKAGES_DIR}/bin FILES_MATCHING PATTERN "*.dylib")
  file(COPY ${CURRENT_PACKAGES_DIR}/debug/wpilib/lib/ DESTINATION ${CURRENT_PACKAGES_DIR}/debug/bin FILES_MATCHING PATTERN "*.dylib")
endif()

file(COPY ${CURRENT_PACKAGES_DIR}/wpilib/lib/ DESTINATION ${CURRENT_PACKAGES_DIR}/lib FILES_MATCHING PATTERN "*.lib")
file(COPY ${CURRENT_PACKAGES_DIR}/debug/wpilib/lib/ DESTINATION ${CURRENT_PACKAGES_DIR}/debug/lib FILES_MATCHING PATTERN "*.lib")

file(COPY ${CURRENT_PACKAGES_DIR}/wpilib/lib/ DESTINATION ${CURRENT_PACKAGES_DIR}/lib FILES_MATCHING PATTERN "*.a")
file(COPY ${CURRENT_PACKAGES_DIR}/debug/wpilib/lib/ DESTINATION ${CURRENT_PACKAGES_DIR}/debug/lib FILES_MATCHING PATTERN "*.a")

vcpkg_copy_pdbs()

file(INSTALL ${SOURCE_PATH}/LICENSE.txt DESTINATION ${CURRENT_PACKAGES_DIR}/share/wpilib RENAME copyright)
