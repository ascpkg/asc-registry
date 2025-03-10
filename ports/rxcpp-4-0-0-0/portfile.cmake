#header-only library
include(vcpkg_common_functions)
set(SOURCE_PATH ${CURRENT_BUILDTREES_DIR}/src/RxCpp-4.0.0)
vcpkg_download_distfile(ARCHIVE
    URLS "https://github.com/Reactive-Extensions/RxCpp/archive/v4.0.0.tar.gz"
    FILENAME "RxCpp-v4.0.0.tar.gz"
    SHA512 df7582925e749fb7f9fbc085566d57a46571e18202aacaa7d35cf9da8152b29dd2886b2d07dae93e538f2a0f7b91d93fb3da23c34c7ea4467772515c794a25b7
)
vcpkg_extract_source_archive(${ARCHIVE})

file(INSTALL
	${SOURCE_PATH}/Rx/v2/src/rxcpp
    DESTINATION ${CURRENT_PACKAGES_DIR}/include
)

file(INSTALL
	${SOURCE_PATH}/Ix/CPP/src/cpplinq
    DESTINATION ${CURRENT_PACKAGES_DIR}/include
)

file(INSTALL
	${SOURCE_PATH}/license.md
	DESTINATION ${CURRENT_PACKAGES_DIR}/share/rxcpp RENAME copyright)