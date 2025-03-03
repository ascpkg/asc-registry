cmake_minimum_required(VERSION 3.9)
project(libass C CXX)

set(LIBASS_VERSION 0.14.0)

configure_file (${CMAKE_CURRENT_SOURCE_DIR}/config.h.in config.h)

include_directories(${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_CURRENT_BINARY_DIR})

if(WIN32)
  add_compile_definitions(CONFIG_DIRECTWRITE)
elseif(APPLE)
  add_compile_definitions(CONFIG_CORETEXT)
else()
  add_compile_definitions(CONFIG_FONTCONFIG)
endif()

add_compile_definitions(CONFIG_FREETYPE)
add_compile_definitions(CONFIG_FRIBIDI)
add_compile_definitions(CONFIG_HARFBUZZ)

file (GLOB_RECURSE SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/libass/*.c)

if(WIN32)
  list(FILTER SOURCES EXCLUDE REGEX ".*ass_coretext.c$")
  list(FILTER SOURCES EXCLUDE REGEX ".*ass_fontconfig.c$")
elseif(APPLE)
  list(FILTER SOURCES EXCLUDE REGEX ".*ass_directwrite.c$")
  list(FILTER SOURCES EXCLUDE REGEX ".*ass_fontconfig.c$")
else()
  list(FILTER SOURCES EXCLUDE REGEX ".*ass_coretext.c$")
  list(FILTER SOURCES EXCLUDE REGEX ".*ass_directwrite.c$")
endif()

find_package(Freetype REQUIRED)

find_path(FRIBIDI_INCLUDE_DIR
          NAMES fribidi.h
          PATH_SUFFIXES fribidi)

find_path(HARFBUZZ_INCLUDE_DIR
          NAMES hb.h
          PATH_SUFFIXES harfbuzz)

find_path(DIRENT_INCLUDE_DIR
          NAMES dirent.h)

find_library(FRIBIDI_LIBRARY NAMES libfribidi fribidi)
find_library(HARFBUZZ_LIBRARY NAMES harfbuzz)

add_library(ass ${SOURCES} ${CMAKE_CURRENT_SOURCE_DIR}/libass.def)

target_include_directories(ass PRIVATE
  ${FRIBIDI_INCLUDE_DIR}
  ${HARFBUZZ_INCLUDE_DIR})
if(DIRENT_INCLUDE_DIR)
    target_include_directories(ass PRIVATE
      ${DIRENT_INCLUDE_DIR})
endif()
target_link_libraries(ass PRIVATE
  Freetype::Freetype
  ${FRIBIDI_LIBRARY}
  ${HARFBUZZ_LIBRARY})

install(TARGETS ass
  RUNTIME DESTINATION bin
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib)

# pkgconfig file
set(prefix ${CMAKE_INSTALL_PREFIX})
set(exec_prefix ${CMAKE_INSTALL_PREFIX})
set(libdir ${CMAKE_INSTALL_PREFIX}/lib)
set(includedir ${CMAKE_INSTALL_PREFIX}/include)
set(PACKAGE_VERSION ${LIBASS_VERSION})
set(PKG_REQUIRES_PRIVATE "harfbuzz >= 0.9.5, fribidi >= 0.19.0, freetype2 >= 9.10.3")
set(PKG_LIBS_PRIVATE -lm)
configure_file(libass.pc.in libass.pc @ONLY)
install(FILES
        ${CMAKE_CURRENT_BINARY_DIR}/libass.pc
        DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)
