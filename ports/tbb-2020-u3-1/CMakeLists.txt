project(tbb CXX)

file(GLOB SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/*)
file(COPY ${SOURCES} DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/src)

include(${CMAKE_CURRENT_BINARY_DIR}/src/cmake/TBBBuild.cmake REQUIRED)
if(NOT BUILD_SHARED_LIBS)
    set(TBB_STATIC_INCLUDE extra_inc=big_iron.inc)
endif()
if(CMAKE_SYSTEM_NAME STREQUAL "Darwin")
  set(FORWARD_SDK_ROOT "SDKROOT=${CMAKE_OSX_SYSROOT}")
endif()

if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
  if(NOT CMAKE_HOST_SYSTEM_PROCESSOR STREQUAL CMAKE_SYSTEM_PROCESSOR)
    set(arch "arch=${CMAKE_SYSTEM_PROCESSOR}")
    if(CMAKE_CXX_COMPILER)
        set(CPLUS "CPLUS=${CMAKE_CXX_COMPILER}")
    endif()
    if(CMAKE_C_COMPILER)
        set(CONLY "CONLY=${CMAKE_C_COMPILER}")
    endif()
  endif()
endif()

tbb_build(TBB_ROOT ${CMAKE_CURRENT_BINARY_DIR}/src MAKE_ARGS ${arch} ${CPLUS} ${CONLY} ${TBB_STATIC_INCLUDE} ${FORWARD_SDK_ROOT})

set(SUBDIR ${CMAKE_CURRENT_BINARY_DIR}/tbb_cmake_build/tbb_cmake_build_subdir)
if(CMAKE_BUILD_TYPE STREQUAL "Release")
    set(SUBDIR "${SUBDIR}_release")
else()
    set(SUBDIR "${SUBDIR}_debug")
endif()

file(GLOB OUTPUTS ${SUBDIR}/*.so.* ${SUBDIR}/*.so ${SUBDIR}/*.a ${SUBDIR}/*.dylib ${SUBDIR}/*.dylib.*)

install(FILES ${OUTPUTS} DESTINATION lib)
