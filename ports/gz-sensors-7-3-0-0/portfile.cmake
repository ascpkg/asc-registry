string(REGEX MATCH "^[1-9]+" VERSION_MAJOR ${VERSION})
string(REGEX MATCH "^gz-([a-z]+)" MATCHED_VALUE ${PORT})
set(PACKAGE_NAME ${CMAKE_MATCH_1})

ignition_modular_library(
   NAME ${PACKAGE_NAME}
   REF ${PORT}${VERSION_MAJOR}_${VERSION}
   VERSION ${VERSION}
   SHA512 968aab8d623c1716c4d0e164e70442e02ebe34f9277bcc48739c620124c80ba4896a846f9d052ac6d9b32b4d8805aee30b4f9c1248f75790de85718f659b6ff6
   OPTIONS 
   PATCHES
)
