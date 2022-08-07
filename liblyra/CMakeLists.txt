cmake_minimum_required(VERSION 3.0.0)
project(lyra_codec VERSION 0.1.0)

include(CTest)
enable_testing()

add_subdirectory(libs/glog-0.6.0)

#add_library(lyra_codec comfort_noise_generator.cc)
#
#add_library(architecture_utils
#        architecture_utils.h
#        )
#
#add_library(layer_wrapper_interface
#        layer_wrapper_interface.h
#        )


set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
