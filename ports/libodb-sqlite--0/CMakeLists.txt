cmake_minimum_required(VERSION 3.0)
project(libodb-sqlite VERSION 2.4.0 LANGUAGES CXX)
find_package(libodb REQUIRED VERSION 2.4.0)
set(LIBODB_INSTALL_HEADERS ON CACHE BOOL "Install the header files (a debug install)")
file(GLOB_RECURSE libodb_src LIST_DIRECTORIES False
    RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}
    *.cxx)
list(FILTER libodb_src EXCLUDE REGEX /posix/.*)
add_library(sqlite ${libodb_src})
target_include_directories(sqlite
    PUBLIC 
        $<INSTALL_INTERFACE:include>
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>

)
target_link_libraries(sqlite libodb::libodb)
if(BUILD_SHARED_LIBS)
    target_compile_definitions(sqlite PRIVATE
        -DLIBODB_SQLITE_DYNAMIC_LIB
        -DLIBODB_SQLITE_HAVE_UNLOCK_NOTIFY)
else()
    target_compile_definitions(sqlite PRIVATE
        -DLIBODB_SQLITE_STATIC_LIB
        -DLIBODB_SQLITE_HAVE_UNLOCK_NOTIFY)
endif()
install(TARGETS sqlite EXPORT libodb_sqliteConfig
    COMPONENT sqlite
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib
    RUNTIME DESTINATION bin
)
if(LIBODB_INSTALL_HEADERS)
install(DIRECTORY odb DESTINATION include/
        COMPONENT sqlite
        FILES_MATCHING
        PATTERN "*.h"
        PATTERN "*.hxx"
        PATTERN "*.ixx"
        PATTERN "*.txx"
)
endif()
install(EXPORT libodb_sqliteConfig DESTINATION share/libodb)
export(TARGETS sqlite NAMESPACE libodb FILE libodb_sqliteConfig.cmake)
