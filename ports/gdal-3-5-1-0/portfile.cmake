vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO OSGeo/gdal
    REF v3.5.1
    SHA512 658e515a16ed2b45a0b3dffa6bb23f28d6454a902d8d9efbed320e353112463ff8e9c3efd5b6c98cf61cf187dc88a0dd13f4989041acc836de2b9c07e8da32e9
    HEAD_REF master
    PATCHES
        find-link-libraries.patch
)
# `vcpkg clean` stumbles over one subdir
file(REMOVE_RECURSE "${SOURCE_PATH}/autotest")

# Cf. cmake/helpers/CheckDependentLibraries.cmake
# The default for all `GDAL_USE_<PKG>` dependencies is `OFF`.
# Here, we explicitly control dependencies provided via vpcpkg.
# "core" is used for a dependency which must be enabled to avoid vendored lib.
vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        cfitsio          GDAL_USE_CFITSIO
        curl             GDAL_USE_CURL
        recommended-features GDAL_USE_EXPAT
        freexl           GDAL_USE_FREEXL
        geos             GDAL_USE_GEOS
        core             GDAL_USE_GEOTIFF
        default-features GDAL_USE_GIF
        hdf5             GDAL_USE_HDF5
        default-features GDAL_USE_ICONV
        default-features GDAL_USE_JPEG
        core             GDAL_USE_JSONC
        lerc             GDAL_USE_LERC
        libkml           GDAL_USE_LIBKML  # TODO, needs policy patches to FindLibKML.cmake
        default-features GDAL_USE_LIBLZMA
        default-features GDAL_USE_LIBXML2
        mysql-libmariadb GDAL_USE_MYSQL 
        netcdf           GDAL_USE_NETCDF
        odbc             GDAL_USE_ODBC
        default-features GDAL_USE_OPENJPEG
        default-features GDAL_USE_OPENSSL
        default-features GDAL_USE_PCRE2
        default-features GDAL_USE_PNG
        poppler          GDAL_USE_POPPLER
        postgresql       GDAL_USE_POSTGRESQL
        default-features GDAL_USE_QHULL
        #core             GDAL_USE_SHAPELIB  # https://github.com/OSGeo/gdal/issues/5711, https://github.com/microsoft/vcpkg/issues/16041
        core             GDAL_USE_SHAPELIB_INTERNAL
        libspatialite    GDAL_USE_SPATIALITE
        recommended-features GDAL_USE_SQLITE3
        core             GDAL_USE_TIFF
        default-features GDAL_USE_WEBP
        core             GDAL_USE_ZLIB
        default-features GDAL_USE_ZSTD
)
if(GDAL_USE_ICONV AND VCPKG_TARGET_IS_WINDOWS)
    list(APPEND FEATURE_OPTIONS -D_ICONV_SECOND_ARGUMENT_IS_NOT_CONST=ON)
endif()

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS_RELEASE
    FEATURES
        tools           BUILD_APPS
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        ${FEATURE_OPTIONS}
        -DBUILD_DOCS=OFF
        -DBUILD_PYTHON_BINDINGS=OFF
        -DBUILD_TESTING=OFF
        -DCMAKE_DISABLE_FIND_PACKAGE_CSharp=ON
        -DCMAKE_DISABLE_FIND_PACKAGE_Java=ON
        -DCMAKE_DISABLE_FIND_PACKAGE_JNI=ON
        -DCMAKE_DISABLE_FIND_PACKAGE_Perl=ON
        -DCMAKE_DISABLE_FIND_PACKAGE_SWIG=ON
        -DGDAL_USE_INTERNAL_LIBS=OFF
        -DGDAL_USE_EXTERNAL_LIBS=OFF
        -DGDAL_BUILD_OPTIONAL_DRIVERS=ON
        -DOGR_BUILD_OPTIONAL_DRIVERS=ON
        -DGDAL_CHECK_PACKAGE_NetCDF_NAMES=netCDF
        -DGDAL_CHECK_PACKAGE_NetCDF_TARGETS=netCDF::netcdf
    OPTIONS_RELEASE
        ${FEATURE_OPTIONS_RELEASE}
    OPTIONS_DEBUG
        -DBUILD_APPS=OFF
)
vcpkg_cmake_install()
vcpkg_copy_pdbs()
vcpkg_fixup_pkgconfig()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/gdal)
vcpkg_replace_string("${CURRENT_PACKAGES_DIR}/share/gdal/GDALConfig.cmake"
    "include(CMakeFindDependencyMacro)"
    "include(CMakeFindDependencyMacro)
# gdal needs a pkg-config tool. A host dependency provides pkgconf.
get_filename_component(vcpkg_host_prefix \"\${CMAKE_CURRENT_LIST_DIR}/../../../${HOST_TRIPLET}\" ABSOLUTE)
list(APPEND CMAKE_PROGRAM_PATH \"\${vcpkg_host_prefix}/tools/pkgconf\")"
)

if (BUILD_APPS)
    vcpkg_copy_tools(
        TOOL_NAMES
            gdalinfo
            gdalbuildvrt
            gdaladdo
            gdal_grid
            gdal_translate
            gdal_rasterize
            gdalsrsinfo
            gdalenhance
            gdalmanage
            gdaltransform
            gdaltindex
            gdaldem
            gdal_create
            gdal_viewshed
            nearblack
            ogrlineref
            ogrtindex
            gdalwarp
            gdal_contour
            gdallocationinfo
            ogrinfo
            ogr2ogr
            ogrlineref
            nearblack
            gdalmdiminfo
            gdalmdimtranslate
            gnmanalyse
            gnmmanage
        AUTO_CLEAN
    )
endif()

file(REMOVE_RECURSE
    "${CURRENT_PACKAGES_DIR}/debug/include"
    "${CURRENT_PACKAGES_DIR}/debug/share"
)
file(GLOB bin_files "${CURRENT_PACKAGES_DIR}/bin/*")
list(REMOVE_ITEM bin_files "${CURRENT_PACKAGES_DIR}/bin/gdal-config")
if(NOT bin_files)
    file(REMOVE_RECURSE
        "${CURRENT_PACKAGES_DIR}/bin"
        "${CURRENT_PACKAGES_DIR}/debug/bin"
    )
endif()

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/vcpkg-cmake-wrapper.cmake" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
file(INSTALL "${SOURCE_PATH}/LICENSE.TXT" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
