cmake_minimum_required(VERSION 3.16)
project(lyra_demo VERSION 0.1.0)

#################################################
#install
#################################################
#install(TARGETS ${MODULE_LIB_NAME}  LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/${ANDROID_ABI})
#install(DIRECTORY  ${PROJECT_PATH}/${module}/api/ DESTINATION ${CMAKE_INSTALL_PREFIX}/api )

set(LIBS_PATH ${CMAKE_SOURCE_DIR}/libs/)
#ADD_SUBDIRECTORY(${LIBS_PATH}/abseil-cpp-20220623.0/)
include(${LIBS_PATH}/abseil-cpp/cmake/abslConfig.cmake)
include(${LIBS_PATH}/glog-0.6.0/glogConfig.cmake)
include(${LIBS_PATH}/protobuf-3.21.4/cmake/protobuf/protobuf-config.cmake)
include(${LIBS_PATH}/eigen/share/eigen3/cmake/Eigen3Config.cmake)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/)

ADD_SUBDIRECTORY(${CMAKE_SOURCE_DIR}/libs/)
ADD_SUBDIRECTORY(${CMAKE_SOURCE_DIR}/app/cpp/)
ADD_SUBDIRECTORY(${CMAKE_SOURCE_DIR}/sparse_matmul/)
ADD_SUBDIRECTORY(${CMAKE_SOURCE_DIR}/liblyra/src)
