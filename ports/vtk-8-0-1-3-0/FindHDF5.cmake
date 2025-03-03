find_package(HDF5 NO_MODULE REQUIRED)

set(HDF5_INCLUDE_DIRS ${HDF5_INCLUDE_DIR})

add_library(vtk::hdf5::hdf5 INTERFACE IMPORTED GLOBAL)
if(TARGET hdf5-static)
    set_target_properties(vtk::hdf5::hdf5 PROPERTIES INTERFACE_LINK_LIBRARIES "hdf5-static")
elseif(TARGET hdf5-shared)
    set_target_properties(vtk::hdf5::hdf5 PROPERTIES INTERFACE_LINK_LIBRARIES "hdf5-shared")
else()
    message(FATAL_ERROR "could not find target hdf5-*")
endif()

add_library(vtk::hdf5::hdf5_hl INTERFACE IMPORTED GLOBAL)
if(TARGET hdf5_hl-static)
    set_target_properties(vtk::hdf5::hdf5_hl PROPERTIES INTERFACE_LINK_LIBRARIES "hdf5_hl-static")
elseif(TARGET hdf5_hl-shared)
    set_target_properties(vtk::hdf5::hdf5_hl PROPERTIES INTERFACE_LINK_LIBRARIES "hdf5_hl-shared")
else()
    message(FATAL_ERROR "could not find target hdf5_hl-*")
endif()

set(HDF5_LIBRARIES vtk::hdf5::hdf5 vtk::hdf5::hdf5_hl)

find_package_handle_standard_args(HDF5
    REQUIRED_VARS HDF5_INCLUDE_DIRS HDF5_LIBRARIES
)
