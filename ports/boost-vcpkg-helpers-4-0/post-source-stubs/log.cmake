file(READ "${SOURCE_PATH}/build/Jamfile.v2" _contents)
string(REPLACE "import ../../config/checks/config" "import config/checks/config" _contents "${_contents}")
string(REPLACE " <conditional>@select-arch-specific-sources" "#<conditional>@select-arch-specific-sources" _contents "${_contents}")
file(WRITE "${SOURCE_PATH}/build/Jamfile.v2" "${_contents}")
file(COPY "${CURRENT_INSTALLED_DIR}/share/boost-config/checks" DESTINATION "${SOURCE_PATH}/build/config")

file(READ ${SOURCE_PATH}/build/log-architecture.jam _contents)
string(REPLACE
    "\nproject.load [ path.join [ path.make $(here:D) ] ../../config/checks/architecture ] ;"
    "\nproject.load [ path.join [ path.make $(here:D) ] config/checks/architecture ] ;"
    _contents "${_contents}")
file(WRITE ${SOURCE_PATH}/build/log-architecture.jam "${_contents}")

