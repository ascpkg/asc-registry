# Using zip archive under Linux would cause sh/perl to report "No such file or directory" or "bad interpreter"
# when invoking `prj_install.pl`.
# So far this issue haven't yet be triggered under WSL 1 distributions. Not sure the root cause of it.
set(ACE_VERSION 7.0.3)
string(REPLACE "." "_" ACE_VERSION_DIRECTORY ${ACE_VERSION})

if("tao" IN_LIST FEATURES)
  if(VCPKG_TARGET_IS_WINDOWS)
      # Don't change to vcpkg_from_github! This points to a release and not an archive
      vcpkg_download_distfile(ARCHIVE
          URLS "https://github.com/DOCGroup/ACE_TAO/releases/download/ACE%2BTAO-${ACE_VERSION_DIRECTORY}/ACE%2BTAO-src-${ACE_VERSION}.zip"
          FILENAME ACE-TAO-${ACE_VERSION}.zip
          SHA512 714d2c25bd4be44a03d350b2457b613b5d2d079fc294f287d10968ed02af5c9c82a2a0c10937acf46a4babfd4582cdc5fa23d6080dadd5cbc4f7f694037033f9
      )
    else()
      # VCPKG_TARGET_IS_LINUX
      vcpkg_download_distfile(ARCHIVE
          URLS "https://github.com/DOCGroup/ACE_TAO/releases/download/ACE%2BTAO-${ACE_VERSION_DIRECTORY}/ACE%2BTAO-src-${ACE_VERSION}.tar.gz"
          FILENAME ACE-TAO-${ACE_VERSION}.tar.gz
          SHA512 e48df1c63bfd02f3a14d049efbcb9a2f476597deaa2b9259d4d852ddfea2319af14e6a1071139b091bff856619e11c650771bfe92c3220d198ec6e931cdd35de
      )
    endif()
else()
  if(VCPKG_TARGET_IS_WINDOWS)
    # Don't change to vcpkg_from_github! This points to a release and not an archive
    vcpkg_download_distfile(ARCHIVE
        URLS "https://github.com/DOCGroup/ACE_TAO/releases/download/ACE%2BTAO-${ACE_VERSION_DIRECTORY}/ACE-src-${ACE_VERSION}.zip"
        FILENAME ACE-src-${ACE_VERSION}.zip
        SHA512 3232ea5437b5fa4a36f4b9d5586c1435a5e2f2dcb34770919a1d1dfe6ebe12e33b316f3c0a1275cdc40c12135800f8cb000ac12b4775f9c31d3ddc48b41bd375
    )
  else(VCPKG_TARGET_IS_WINDOWS)
    # VCPKG_TARGET_IS_LINUX
    vcpkg_download_distfile(ARCHIVE
        URLS "https://github.com/DOCGroup/ACE_TAO/releases/download/ACE%2BTAO-${ACE_VERSION_DIRECTORY}/ACE-src-${ACE_VERSION}.tar.gz"
        FILENAME ACE-src-${ACE_VERSION}.tar.gz
        SHA512 019ec5c9f23c103d659ec57f6c7bfda3d6d12fc4ca77373353d6232c5fa24c03ffba222af45bd4afe997f02a81f834546cfbcb0e667000857b6e12f2ca3effaa
    )
  endif()
endif()

vcpkg_extract_source_archive_ex(
    OUT_SOURCE_PATH SOURCE_PATH
    ARCHIVE ${ARCHIVE}
)

set(ACE_ROOT ${SOURCE_PATH})
set(ENV{ACE_ROOT} ${ACE_ROOT})
set(ACE_SOURCE_PATH ${ACE_ROOT}/ace)
if("tao" IN_LIST FEATURES)
  set(TAO_ROOT ${SOURCE_PATH}/TAO)
  set(ENV{TAO_ROOT} ${TAO_ROOT})
  set(WORKSPACE ${TAO_ROOT}/TAO_ACE)
else()
  set(WORKSPACE ${ACE_ROOT}/ace/ace)
endif()
if("wchar" IN_LIST FEATURES)
    list(APPEND ACE_FEATURE_LIST "uses_wchar=1")
endif()
if("zlib" IN_LIST FEATURES)
    list(APPEND ACE_FEATURE_LIST "zlib=1")
    set(ENV{ZLIB_ROOT} ${CURRENT_INSTALLED_DIR})
else()
    list(APPEND ACE_FEATURE_LIST "zlib=0")
endif()
if("ssl" IN_LIST FEATURES)
    list(APPEND ACE_FEATURE_LIST "ssl=1")
    list(APPEND ACE_FEATURE_LIST "openssl11=1")
    set(ENV{SSL_ROOT} ${CURRENT_INSTALLED_DIR})
else()
    list(APPEND ACE_FEATURE_LIST "ssl=0")
endif()
list(JOIN ACE_FEATURE_LIST "," ACE_FEATURES)

if (VCPKG_LIBRARY_LINKAGE STREQUAL static)
  set(MPC_STATIC_FLAG -static)
endif()

# Acquire Perl and add it to PATH (for execution of MPC)
vcpkg_find_acquire_program(PERL)
get_filename_component(PERL_PATH ${PERL} DIRECTORY)
vcpkg_add_to_path(${PERL_PATH})

if (TRIPLET_SYSTEM_ARCH MATCHES "x86")
    set(MSBUILD_PLATFORM "Win32")
else ()
    set(MSBUILD_PLATFORM ${TRIPLET_SYSTEM_ARCH})
endif()

# Add ace/config.h file
# see https://htmlpreview.github.io/?https://github.com/DOCGroup/ACE_TAO/blob/master/ACE/ACE-INSTALL.html
if(VCPKG_TARGET_IS_WINDOWS)
  if(VCPKG_PLATFORM_TOOLSET MATCHES "v142")
    set(SOLUTION_TYPE vs2019)
  elseif(VCPKG_PLATFORM_TOOLSET MATCHES "v141")
    set(SOLUTION_TYPE vs2017)
  else()
    set(SOLUTION_TYPE vc14)
  endif()
  file(WRITE ${ACE_SOURCE_PATH}/config.h "#include \"ace/config-windows.h\"")
elseif(VCPKG_TARGET_IS_LINUX)
  set(SOLUTION_TYPE gnuace)
  file(WRITE ${ACE_SOURCE_PATH}/config.h "#include \"ace/config-linux.h\"")
  file(WRITE ${ACE_ROOT}/include/makeinclude/platform_macros.GNU "include $(ACE_ROOT)/include/makeinclude/platform_linux.GNU")
elseif(VCPKG_TARGET_IS_OSX)
  set(SOLUTION_TYPE gnuace)
  file(WRITE ${ACE_SOURCE_PATH}/config.h "#include \"ace/config-macosx.h\"")
  file(WRITE ${ACE_ROOT}/include/makeinclude/platform_macros.GNU "include $(ACE_ROOT)/include/makeinclude/platform_macosx.GNU")
endif()

if(VCPKG_TARGET_IS_UWP)
  set(MPC_VALUE_TEMPLATE -value_template link_options+=/APPCONTAINER)
endif()

# Invoke mwc.pl to generate the necessary solution and project files
vcpkg_execute_build_process(
    COMMAND ${PERL} ${ACE_ROOT}/bin/mwc.pl -type ${SOLUTION_TYPE} -features "${ACE_FEATURES}" ${WORKSPACE}.mwc ${MPC_STATIC_FLAG} ${MPC_VALUE_TEMPLATE}
    WORKING_DIRECTORY ${ACE_ROOT}
    LOGNAME mwc-${TARGET_TRIPLET}
)

if("xml" IN_LIST FEATURES)
  vcpkg_execute_build_process(
      COMMAND ${PERL} ${ACE_ROOT}/bin/mwc.pl -type ${SOLUTION_TYPE} -features "${ACE_FEATURES}" ${ACE_ROOT}/ACEXML/ACEXML.mwc ${MPC_STATIC_FLAG} ${MPC_VALUE_TEMPLATE}
      WORKING_DIRECTORY ${ACE_ROOT}/ACEXML
      LOGNAME mwc-xml-${TARGET_TRIPLET}
  )
endif()

if(VCPKG_TARGET_IS_WINDOWS)
  if("tao" IN_LIST FEATURES OR "xml" IN_LIST FEATURES)
    file(WRITE ${SOURCE_PATH}/Directory.Build.props "<?xml version=\"1.0\" encoding=\"utf-8\"?>
                                                     <Project xmlns=\"http://schemas.microsoft.com/developer/msbuild/2003\">
                                                     <ItemDefinitionGroup>
                                                     <ClCompile>
                                                     <AdditionalOptions>/MP</AdditionalOptions>
                                                     <AdditionalIncludeDirectories>${ACE_ROOT}</AdditionalIncludeDirectories>
                                                     </ClCompile>
                                                     <Link>
                                                     <AdditionalLibraryDirectories>${CURRENT_PACKAGES_DIR}/lib;${CURRENT_PACKAGES_DIR}/debug/lib;${CURRENT_INSTALLED_DIR}/lib;${CURRENT_INSTALLED_DIR}/debug/lib</AdditionalLibraryDirectories>
                                                     </Link>
                                                     </ItemDefinitionGroup>
                                                     </Project>")
  endif()

  file(RELATIVE_PATH PROJECT_SUBPATH ${SOURCE_PATH} ${WORKSPACE}.sln)
  vcpkg_install_msbuild(
    SOURCE_PATH ${SOURCE_PATH}
    PROJECT_SUBPATH ${PROJECT_SUBPATH}
    LICENSE_SUBPATH COPYING
    PLATFORM ${MSBUILD_PLATFORM}
    SKIP_CLEAN
  )

  # ACE itself does not define an install target, so it is not clear which
  # headers are public and which not. For the moment we install everything
  # that is in the source path and ends in .h, .inl
  function(install_includes ORIGINAL_PATH RELATIVE_PATHS)
    foreach(RELATIVE_PATH ${RELATIVE_PATHS})
      file(
        GLOB
        HEADER_FILES
        ${ORIGINAL_PATH}/${RELATIVE_PATH}/*.h
        ${ORIGINAL_PATH}/${RELATIVE_PATH}/*.hpp
        ${ORIGINAL_PATH}/${RELATIVE_PATH}/*.inl
        ${ORIGINAL_PATH}/${RELATIVE_PATH}/*.cpp
        ${ORIGINAL_PATH}/${RELATIVE_PATH}/*.idl
        ${ORIGINAL_PATH}/${RELATIVE_PATH}/*.pidl)
      file(INSTALL ${HEADER_FILES}
           DESTINATION ${CURRENT_PACKAGES_DIR}/include/${RELATIVE_PATH})
    endforeach()
  endfunction()

  get_filename_component(SOURCE_PATH_SUFFIX "${SOURCE_PATH}" NAME)
  set(SOURCE_COPY_PATH ${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-rel/${SOURCE_PATH_SUFFIX})

  # Install headers in subdirectory
  set(ACE_INCLUDE_FOLDERS
      "ace"
      "ace/Compression"
      "ace/Compression/rle"
      "ace/ETCL"
      "ace/QoS"
      "ace/Monitor_Control"
      "ace/os_include"
      "ace/os_include/arpa"
      "ace/os_include/net"
      "ace/os_include/netinet"
      "ace/os_include/sys")
  install_includes(${SOURCE_COPY_PATH} "${ACE_INCLUDE_FOLDERS}")

  if("ssl" IN_LIST FEATURES)
    install_includes(${SOURCE_COPY_PATH} "ace/SSL")
  endif()

  if("tao" IN_LIST FEATURES)
    set(ACEXML_INCLUDE_FOLDERS "ACEXML/apps/svcconf" "ACEXML/common"
                               "ACEXML/parser/parser")
    install_includes(${SOURCE_COPY_PATH} "${ACEXML_INCLUDE_FOLDERS}")

    set(ACE_PROTOCOLS_INCLUDE_FOLDERS "ace/HTBP" "ace/INet" "ace/RMCast"
                                      "ace/TMCast")
    install_includes(${SOURCE_COPY_PATH}/protocols "${ACE_PROTOCOLS_INCLUDE_FOLDERS}")

    install_includes(${SOURCE_COPY_PATH} "Kokyu")

    set(TAO_ORBSVCS_INCLUDE_FOLDERS
        "orbsvcs"
        "orbsvcs/AV"
        "orbsvcs/Concurrency"
        "orbsvcs/CosEvent"
        "orbsvcs/Event"
        "orbsvcs/FaultTolerance"
        "orbsvcs/FtRtEvent/ClientORB"
        "orbsvcs/FtRtEvent/EventChannel"
        "orbsvcs/FtRtEvent/Utils"
        "orbsvcs/HTIOP"
        "orbsvcs/IFRService"
        "orbsvcs/LifeCycle"
        "orbsvcs/LoadBalancing"
        "orbsvcs/Log"
        "orbsvcs/Naming"
        "orbsvcs/Naming/FaultTolerant"
        "orbsvcs/Notify"
        "orbsvcs/Notify/Any"
        "orbsvcs/Notify/MonitorControl"
        "orbsvcs/Notify/MonitorControlExt"
        "orbsvcs/Notify/Sequence"
        "orbsvcs/Notify/Structured"
        "orbsvcs/PortableGroup"
        "orbsvcs/Property"
        "orbsvcs/Sched"
        "orbsvcs/Security"
        "orbsvcs/Time"
        "orbsvcs/Trader")
    if("ssl" IN_LIST FEATURES)
      list(APPEND TAO_ORBSVCS_INCLUDE_FOLDERS "orbsvcs/SSLIOP")
    endif()
    install_includes(${SOURCE_COPY_PATH}/TAO/orbsvcs "${TAO_ORBSVCS_INCLUDE_FOLDERS}")

    set(TAO_ROOT_ORBSVCS_INCLUDE_FOLDERS "orbsvcs/FT_ReplicationManager"
                                         "orbsvcs/Notify_Service")
    install_includes(${SOURCE_COPY_PATH}/TAO "${TAO_ROOT_ORBSVCS_INCLUDE_FOLDERS}")

    set(TAO_INCLUDE_FOLDERS
        "tao"
        "tao/AnyTypeCode"
        "tao/BiDir_GIOP"
        "tao/CSD_Framework"
        "tao/CSD_ThreadPool"
        "tao/CodecFactory"
        "tao/Codeset"
        "tao/Compression"
        "tao/Compression/rle"
        "tao/DiffServPolicy"
        "tao/DynamicAny"
        "tao/DynamicInterface"
        "tao/Dynamic_TP"
        "tao/ETCL"
        "tao/EndpointPolicy"
        "tao/IFR_Client"
        "tao/IORInterceptor"
        "tao/IORManipulation"
        "tao/IORTable"
        "tao/ImR_Client"
        "tao/Messaging"
        "tao/Monitor"
        "tao/ObjRefTemplate"
        "tao/PI"
        "tao/PI_Server"
        "tao/PortableServer"
        "tao/RTCORBA"
        "tao/RTPortableServer"
        "tao/RTScheduling"
        "tao/SmartProxies"
        "tao/Strategies"
        "tao/TransportCurrent"
        "tao/TypeCodeFactory"
        "tao/Utils"
        "tao/Valuetype"
        "tao/ZIOP")
    if("zlib" IN_LIST FEATURES)
      list(APPEND TAO_INCLUDE_FOLDERS "tao/Compression/zlib")
    endif()
    install_includes(${SOURCE_COPY_PATH}/TAO "${TAO_INCLUDE_FOLDERS}")
  endif()

  if("xml" IN_LIST FEATURES)
    file(RELATIVE_PATH PROJECT_SUBPATH_XML ${SOURCE_PATH} ${ACE_ROOT}/ACEXML/ACEXML.sln)
    vcpkg_install_msbuild(
      SOURCE_PATH ${SOURCE_PATH}
      PROJECT_SUBPATH ${PROJECT_SUBPATH_XML}
      LICENSE_SUBPATH COPYING
      PLATFORM ${MSBUILD_PLATFORM}
      SKIP_CLEAN
    )

    set(ACEXML_INCLUDE_FOLDERS "ACEXML/common"
                               "ACEXML/parser/parser")
    install_includes(${SOURCE_COPY_PATH} "${ACEXML_INCLUDE_FOLDERS}")
  endif()

  # Remove dlls without any export
  if("tao" IN_LIST FEATURES OR "xml" IN_LIST FEATURES)
    if(VCPKG_LIBRARY_LINKAGE STREQUAL dynamic)
      file(REMOVE
        ${CURRENT_PACKAGES_DIR}/bin/ACEXML_XML_Svc_Conf_Parser.dll
        ${CURRENT_PACKAGES_DIR}/bin/ACEXML_XML_Svc_Conf_Parser.pdb
        ${CURRENT_PACKAGES_DIR}/debug/bin/ACEXML_XML_Svc_Conf_Parserd.dll
        ${CURRENT_PACKAGES_DIR}/debug/bin/ACEXML_XML_Svc_Conf_Parserd_dll.pdb)
    endif()
  endif()

  # remove (erroneous) duplicate libs
  if("tao" IN_LIST FEATURES)
    if(VCPKG_LIBRARY_LINKAGE STREQUAL dynamic)
      file(REMOVE
        ${CURRENT_PACKAGES_DIR}/debug/lib/tao_cosconcurrency.lib
        ${CURRENT_PACKAGES_DIR}/debug/lib/tao_cosevent.lib
        ${CURRENT_PACKAGES_DIR}/debug/lib/tao_coslifecycle.lib
        ${CURRENT_PACKAGES_DIR}/debug/lib/tao_cosnaming.lib
        ${CURRENT_PACKAGES_DIR}/debug/lib/tao_cosnotification.lib
        ${CURRENT_PACKAGES_DIR}/debug/lib/tao_costrading.lib
        ${CURRENT_PACKAGES_DIR}/debug/lib/tao_imr_activator.lib
        ${CURRENT_PACKAGES_DIR}/debug/lib/tao_imr_locator.lib
        ${CURRENT_PACKAGES_DIR}/debug/lib/tao_rtevent.lib)
    endif()
  endif()

  vcpkg_clean_msbuild()
elseif(VCPKG_TARGET_IS_LINUX OR VCPKG_TARGET_IS_OSX)
  FIND_PROGRAM(MAKE make)
  IF (NOT MAKE)
    MESSAGE(FATAL_ERROR "MAKE not found")
  ENDIF ()

  if("ssl" IN_LIST FEATURES)
    list(APPEND _ace_makefile_macros "ssl=1")
  endif()

  set(ENV{INSTALL_PREFIX} ${CURRENT_PACKAGES_DIR})
  # Set `PWD` environment variable since ACE's `install` make target calculates install dir using this env.
  set(_prev_env $ENV{PWD})
  get_filename_component(WORKING_DIR ${WORKSPACE} DIRECTORY)
  set(ENV{PWD} ${WORKING_DIR})

  message(STATUS "Building ${TARGET_TRIPLET}-dbg")
  vcpkg_execute_build_process(
    COMMAND make ${_ace_makefile_macros} "debug=1" "optimize=0" "-j${VCPKG_CONCURRENCY}"
    WORKING_DIRECTORY ${WORKING_DIR}
    LOGNAME make-${TARGET_TRIPLET}-dbg
  )
  if("xml" IN_LIST FEATURES)
    vcpkg_execute_build_process(
      COMMAND make ${_ace_makefile_macros} "debug=1" "optimize=0" "-j${VCPKG_CONCURRENCY}"
      WORKING_DIRECTORY ${WORKING_DIR}/ACEXML
      LOGNAME make-xml-${TARGET_TRIPLET}-dbg
    )
  endif()
  message(STATUS "Building ${TARGET_TRIPLET}-dbg done")
  message(STATUS "Packaging ${TARGET_TRIPLET}-dbg")
  vcpkg_execute_build_process(
    COMMAND make ${_ace_makefile_macros} install
    WORKING_DIRECTORY ${WORKING_DIR}
    LOGNAME install-${TARGET_TRIPLET}-dbg
  )
  if("xml" IN_LIST FEATURES)
    vcpkg_execute_build_process(
      COMMAND make ${_ace_makefile_macros} install
      WORKING_DIRECTORY ${WORKING_DIR}/ACEXML
      LOGNAME install-xml-${TARGET_TRIPLET}-dbg
    )
  endif()

  file(COPY ${CURRENT_PACKAGES_DIR}/lib DESTINATION ${CURRENT_PACKAGES_DIR}/debug)

  file(GLOB _pkg_components ${CURRENT_PACKAGES_DIR}/debug/lib/pkgconfig/*.pc)
  foreach(_pkg_comp ${_pkg_components})
    file(READ ${_pkg_comp} _content)
    string(REPLACE "libdir=${CURRENT_PACKAGES_DIR}/lib" "libdir=${CURRENT_PACKAGES_DIR}/debug/lib" _content ${_content})
    file(WRITE ${_pkg_comp} ${_content})
  endforeach()
  message(STATUS "Packaging ${TARGET_TRIPLET}-dbg done")

  vcpkg_execute_build_process(
    COMMAND make ${_ace_makefile_macros} realclean
    WORKING_DIRECTORY ${WORKING_DIR}
    LOGNAME realclean-${TARGET_TRIPLET}-dbg
  )
  if("xml" IN_LIST FEATURES)
    vcpkg_execute_build_process(
      COMMAND make ${_ace_makefile_macros} realclean
      WORKING_DIRECTORY ${WORKING_DIR}/ACEXML
      LOGNAME realclean-xml-${TARGET_TRIPLET}-dbg
    )
  endif()

  message(STATUS "Building ${TARGET_TRIPLET}-rel")
  vcpkg_execute_build_process(
    COMMAND make ${_ace_makefile_macros} "-j${VCPKG_CONCURRENCY}"
    WORKING_DIRECTORY ${WORKING_DIR}
    LOGNAME make-${TARGET_TRIPLET}-rel
  )
  if("xml" IN_LIST FEATURES)
    vcpkg_execute_build_process(
      COMMAND make ${_ace_makefile_macros} "-j${VCPKG_CONCURRENCY}"
      WORKING_DIRECTORY ${WORKING_DIR}/ACEXML
      LOGNAME make-xml-${TARGET_TRIPLET}-rel
    )
  endif()
  message(STATUS "Building ${TARGET_TRIPLET}-rel done")
  message(STATUS "Packaging ${TARGET_TRIPLET}-rel")
  vcpkg_execute_build_process(
    COMMAND make ${_ace_makefile_macros} install
    WORKING_DIRECTORY ${WORKING_DIR}
    LOGNAME install-${TARGET_TRIPLET}-rel
  )
  if("xml" IN_LIST FEATURES)
    vcpkg_execute_build_process(
      COMMAND make ${_ace_makefile_macros} install
      WORKING_DIRECTORY ${WORKING_DIR}/ACEXML
      LOGNAME install-xml-${TARGET_TRIPLET}-rel
    )
  endif()
  if("tao" IN_LIST FEATURES)
    file(MAKE_DIRECTORY ${CURRENT_PACKAGES_DIR}/tools)
    file(RENAME ${CURRENT_PACKAGES_DIR}/bin ${CURRENT_PACKAGES_DIR}/tools/${PORT})
  endif()
  message(STATUS "Packaging ${TARGET_TRIPLET}-rel done")
  # Restore `PWD` environment variable
  set($ENV{PWD} _prev_env)

  # Handle copyright
  file(INSTALL ${ACE_ROOT}/COPYING DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)

  file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/share/ace/bin/MakeProjectCreator")
  file(REMOVE "${CURRENT_PACKAGES_DIR}/share/ace/ace-devel.sh")
endif()

vcpkg_fixup_pkgconfig()
