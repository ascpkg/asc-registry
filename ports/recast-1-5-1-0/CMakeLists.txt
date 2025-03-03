cmake_minimum_required(VERSION 3.8)
project(recast)

include_directories(
  DebugUtils/Include
  Detour/Include
  DetourCrowd/Include
  DetourTileCache/Include
  Recast/Include
)

set(SRC
  DebugUtils/Source/DebugDraw.cpp
  DebugUtils/Source/DetourDebugDraw.cpp
  DebugUtils/Source/RecastDebugDraw.cpp
  DebugUtils/Source/RecastDump.cpp
  Detour/Source/DetourAlloc.cpp
  Detour/Source/DetourCommon.cpp
  Detour/Source/DetourNavMesh.cpp
  Detour/Source/DetourNavMeshBuilder.cpp
  Detour/Source/DetourNavMeshQuery.cpp
  Detour/Source/DetourNode.cpp
  DetourCrowd/Source/DetourCrowd.cpp
  DetourCrowd/Source/DetourLocalBoundary.cpp
  DetourCrowd/Source/DetourObstacleAvoidance.cpp
  DetourCrowd/Source/DetourPathCorridor.cpp
  DetourCrowd/Source/DetourPathQueue.cpp
  DetourCrowd/Source/DetourProximityGrid.cpp
  DetourTileCache/Source/DetourTileCache.cpp
  DetourTileCache/Source/DetourTileCacheBuilder.cpp
  Recast/Source/Recast.cpp
  Recast/Source/RecastAlloc.cpp
  Recast/Source/RecastArea.cpp
  Recast/Source/RecastContour.cpp
  Recast/Source/RecastFilter.cpp
  Recast/Source/RecastLayers.cpp
  Recast/Source/RecastMesh.cpp
  Recast/Source/RecastMeshDetail.cpp
  Recast/Source/RecastRasterization.cpp
  Recast/Source/RecastRegion.cpp
)

add_library(recast ${SRC})

install(
  TARGETS recast
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
)

if(NOT DISABLE_INSTALL_HEADERS)
  install(DIRECTORY DebugUtils/Include/ DESTINATION include/recast/DebugUtils)
  install(DIRECTORY Detour/Include/ DESTINATION include/recast/Detour)
  install(DIRECTORY DetourCrowd/Include/ DESTINATION include/recast/DetourCrowd)
  install(DIRECTORY DetourTileCache/Include/ DESTINATION include/recast/DetourTileCache)
  install(DIRECTORY Recast/Include/ DESTINATION include/recast/Recast)
endif()
