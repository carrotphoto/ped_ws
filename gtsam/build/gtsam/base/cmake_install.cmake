# Install script for directory: /home/robot/ped_ws/src/gtsam/gtsam/base

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gtsam/base" TYPE FILE FILES
    "/home/robot/ped_ws/src/gtsam/gtsam/base/ConcurrentMap.h"
    "/home/robot/ped_ws/src/gtsam/gtsam/base/DSFVector.h"
    "/home/robot/ped_ws/src/gtsam/gtsam/base/FastDefaultAllocator.h"
    "/home/robot/ped_ws/src/gtsam/gtsam/base/FastList.h"
    "/home/robot/ped_ws/src/gtsam/gtsam/base/FastMap.h"
    "/home/robot/ped_ws/src/gtsam/gtsam/base/FastSet.h"
    "/home/robot/ped_ws/src/gtsam/gtsam/base/FastVector.h"
    "/home/robot/ped_ws/src/gtsam/gtsam/base/GenericValue.h"
    "/home/robot/ped_ws/src/gtsam/gtsam/base/Group.h"
    "/home/robot/ped_ws/src/gtsam/gtsam/base/Lie.h"
    "/home/robot/ped_ws/src/gtsam/gtsam/base/LieMatrix.h"
    "/home/robot/ped_ws/src/gtsam/gtsam/base/LieScalar.h"
    "/home/robot/ped_ws/src/gtsam/gtsam/base/LieVector.h"
    "/home/robot/ped_ws/src/gtsam/gtsam/base/Manifold.h"
    "/home/robot/ped_ws/src/gtsam/gtsam/base/Matrix.h"
    "/home/robot/ped_ws/src/gtsam/gtsam/base/OptionalJacobian.h"
    "/home/robot/ped_ws/src/gtsam/gtsam/base/ProductLieGroup.h"
    "/home/robot/ped_ws/src/gtsam/gtsam/base/SymmetricBlockMatrix.h"
    "/home/robot/ped_ws/src/gtsam/gtsam/base/Testable.h"
    "/home/robot/ped_ws/src/gtsam/gtsam/base/TestableAssertions.h"
    "/home/robot/ped_ws/src/gtsam/gtsam/base/ThreadsafeException.h"
    "/home/robot/ped_ws/src/gtsam/gtsam/base/Value.h"
    "/home/robot/ped_ws/src/gtsam/gtsam/base/Vector.h"
    "/home/robot/ped_ws/src/gtsam/gtsam/base/VectorSpace.h"
    "/home/robot/ped_ws/src/gtsam/gtsam/base/VerticalBlockMatrix.h"
    "/home/robot/ped_ws/src/gtsam/gtsam/base/chartTesting.h"
    "/home/robot/ped_ws/src/gtsam/gtsam/base/cholesky.h"
    "/home/robot/ped_ws/src/gtsam/gtsam/base/concepts.h"
    "/home/robot/ped_ws/src/gtsam/gtsam/base/debug.h"
    "/home/robot/ped_ws/src/gtsam/gtsam/base/lieProxies.h"
    "/home/robot/ped_ws/src/gtsam/gtsam/base/numericalDerivative.h"
    "/home/robot/ped_ws/src/gtsam/gtsam/base/serialization.h"
    "/home/robot/ped_ws/src/gtsam/gtsam/base/serializationTestHelpers.h"
    "/home/robot/ped_ws/src/gtsam/gtsam/base/testLie.h"
    "/home/robot/ped_ws/src/gtsam/gtsam/base/timing.h"
    "/home/robot/ped_ws/src/gtsam/gtsam/base/treeTraversal-inst.h"
    "/home/robot/ped_ws/src/gtsam/gtsam/base/types.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gtsam/base/treeTraversal" TYPE FILE FILES
    "/home/robot/ped_ws/src/gtsam/gtsam/base/treeTraversal/parallelTraversalTasks.h"
    "/home/robot/ped_ws/src/gtsam/gtsam/base/treeTraversal/statistics.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gtsam/base/deprecated" TYPE FILE FILES
    "/home/robot/ped_ws/src/gtsam/gtsam/base/deprecated/LieMatrix.h"
    "/home/robot/ped_ws/src/gtsam/gtsam/base/deprecated/LieScalar.h"
    "/home/robot/ped_ws/src/gtsam/gtsam/base/deprecated/LieVector.h"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/robot/ped_ws/src/gtsam/build/gtsam/base/tests/cmake_install.cmake")

endif()

