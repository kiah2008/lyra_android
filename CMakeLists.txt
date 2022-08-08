cmake_minimum_required(VERSION 3.16)
project(lyra_demo VERSION 0.1.0)

#################################################
#install
#################################################
#install(TARGETS ${MODULE_LIB_NAME}  LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/${ANDROID_ABI})
#install(DIRECTORY  ${PROJECT_PATH}/${module}/api/ DESTINATION ${CMAKE_INSTALL_PREFIX}/api )

ADD_SUBDIRECTORY(${CMAKE_SOURCE_DIR}/libs/)
ADD_SUBDIRECTORY(${CMAKE_SOURCE_DIR}/app/cpp/)
ADD_SUBDIRECTORY(${CMAKE_SOURCE_DIR}/liblyra/)
ADD_SUBDIRECTORY(${CMAKE_SOURCE_DIR}/sparse_matmul/)