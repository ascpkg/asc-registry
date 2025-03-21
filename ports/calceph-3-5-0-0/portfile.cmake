vcpkg_fail_port_install(ON_TARGET "uwp")

set(CALCEPH_VERSION "3.5.0")
set(CALCEPH_HASH 12bb269d846aab93799656919cd9ca5a995248fb806727ea95667374b9380ca8f52c57dc6a5930c6995c13749bff1459c430eb2908b1533a8804fcb6b95c3de9)

vcpkg_download_distfile(ARCHIVE
    URLS "https://www.imcce.fr/content/medias/recherche/equipes/asd/calceph/calceph-${CALCEPH_VERSION}.tar.gz"
    FILENAME "calceph-${CALCEPH_VERSION}.tar.gz"
    SHA512 ${CALCEPH_HASH}
)

vcpkg_extract_source_archive_ex(
    OUT_SOURCE_PATH SOURCE_PATH
    ARCHIVE ${ARCHIVE}
    PATCHES makefilevc.patch
)

if (VCPKG_TARGET_IS_WINDOWS)
    
    vcpkg_install_nmake(
        SOURCE_PATH "${SOURCE_PATH}"
        OPTIONS
        OPTIONS_DEBUG
            DESTDIR="${CURRENT_INSTALLED_DIR}/calceph/debug"
            CFLAGS="${VCPKG_C_FLAGS_DEBUG} "
        OPTIONS_RELEASE
            DESTDIR="${CURRENT_INSTALLED_DIR}/calceph"
            CFLAGS="${VCPKG_C_FLAGS_RELEASE} "
    )
    file(INSTALL "${CURRENT_INSTALLED_DIR}/calceph/include/calceph.h" DESTINATION "${CURRENT_PACKAGES_DIR}/include")
    file(INSTALL "${CURRENT_INSTALLED_DIR}/calceph/lib/libcalceph.lib" DESTINATION "${CURRENT_PACKAGES_DIR}/lib")
    file(INSTALL "${CURRENT_INSTALLED_DIR}/calceph/debug/lib/libcalceph.lib" DESTINATION "${CURRENT_PACKAGES_DIR}/debug/lib")
	file(REMOVE_RECURSE "${CURRENT_INSTALLED_DIR}/calceph")

else() # Build in UNIX
    vcpkg_configure_make(
    AUTOCONFIG
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS ${OPTIONS}
      --enable-fortran=no
      --enable-thread=yes
    )
    
    vcpkg_install_make()
    file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
    
endif()

    file(INSTALL "${SOURCE_PATH}/README.rst" DESTINATION "${CURRENT_PACKAGES_DIR}/share/calceph" RENAME readme.rst)
    file(INSTALL "${SOURCE_PATH}/COPYING_CECILL_B.LIB" DESTINATION "${CURRENT_PACKAGES_DIR}/share/calceph" RENAME copyright)
    file(INSTALL "${SOURCE_PATH}/doc/calceph_c.pdf" DESTINATION "${CURRENT_PACKAGES_DIR}/share/calceph" RENAME calceph_c.pdf)
