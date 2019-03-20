# - Config file for GTSAM
# It defines the following variables
#  GTSAM_INCLUDE_DIR - include directories for GTSAM

# Compute paths
get_filename_component(OUR_CMAKE_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
if(EXISTS "${OUR_CMAKE_DIR}/CMakeCache.txt")
  # In build tree
  set(GTSAM_INCLUDE_DIR /home/robot/ped_ws/src/gtsam CACHE PATH "GTSAM include directory")
else()
  # Find installed library
  set(GTSAM_INCLUDE_DIR "${OUR_CMAKE_DIR}/../../../include" CACHE PATH "GTSAM include directory")
endif()

# Find dependencies, required by cmake exported targets:
include(CMakeFindDependencyMacro)
find_dependency(Boost 1.43 COMPONENTS serialization;system;filesystem;thread;program_options;date_time;timer;chrono;regex)

# Load exports
include(${OUR_CMAKE_DIR}/GTSAM-exports.cmake)

# Load project-specific flags, if present
if(EXISTS "${OUR_CMAKE_DIR}/gtsam_extra.cmake")
	include("${OUR_CMAKE_DIR}/gtsam_extra.cmake")
endif()

message(STATUS "GTSAM include directory:  ${GTSAM_INCLUDE_DIR}")
