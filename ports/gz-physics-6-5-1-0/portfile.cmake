string(REGEX MATCH "^[1-9]+" VERSION_MAJOR ${VERSION})
string(REGEX MATCH "^gz-([a-z]+)" MATCHED_VALUE ${PORT})
set(PACKAGE_NAME ${CMAKE_MATCH_1})

ignition_modular_library(
   NAME ${PACKAGE_NAME}
   REF ${PORT}${VERSION_MAJOR}_${VERSION}
   VERSION ${VERSION}
   SHA512 c29594663509234e25c7d0a33848c0fe222c2b9471513978c18ea6873a17c66c43b4037c74e8849995fa6449c2dddc0f2ee669605893daf65119c277a17f39e1
   OPTIONS 
   PATCHES
      dependencies.patch
)

if(VCPKG_TARGET_IS_WINDOWS)   
   file(GLOB plugins "${CURRENT_PACKAGES_DIR}/lib/${PORT}-${VERSION_MAJOR}/engine-plugins/*.dll")
   if (NOT plugins STREQUAL "")
      file(COPY ${plugins} DESTINATION "${CURRENT_PACKAGES_DIR}/engine-plugins/")
      file(REMOVE ${plugins})
   endif()

   file(GLOB plugins_debug "${CURRENT_PACKAGES_DIR}/debug/lib/${PORT}-${VERSION_MAJOR}/engine-plugins/*.dll")
   if (NOT plugins_debug STREQUAL "")
      file(COPY ${plugins_debug} DESTINATION "${CURRENT_PACKAGES_DIR}/debug/engine-plugins/")
      file(REMOVE ${plugins_debug})
   endif()
endif()
