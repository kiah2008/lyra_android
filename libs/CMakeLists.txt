cmake_minimum_required(VERSION 3.16)
project("lyra demo libs")

add_library(abseil_hdrs INTERFACE)
target_include_directories(
        abseil_hdrs
        INTERFACE
        ${CMAKE_CURRENT_SOURCE_DIR}/abseil-cpp/include/
)


add_library(glog_hdrs INTERFACE)
target_include_directories(
        glog_hdrs
        INTERFACE
        ${CMAKE_CURRENT_SOURCE_DIR}/glog-0.6.0/
)

if (NOT EXISTS  ${CMAKE_CURRENT_SOURCE_DIR}/glog-0.6.0/${ANDROID_ABI}/libglog.so)
    MESSAGE(FATAL_ERROR "not exit  ${CMAKE_CURRENT_SOURCE_DIR}/glog-0.6.0/${ANDROID_ABI}/libglog.so")
endif()

add_library(glog_lib SHARED IMPORTED)
set_target_properties(glog_lib PROPERTIES IMPORTED_LOCATION
        ${CMAKE_CURRENT_SOURCE_DIR}/glog-0.6.0/${ANDROID_ABI}/libglog.so)

if (NOT TARGET glog_lib)
    MESSAGE(FATAL_ERROR "============= no lib ${glog_lib}!")
endif()

#install(TARGETS glog_lib  LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}/libs/${ANDROID_ABI})
ADD_SUBDIRECTORY(hello_world)

#set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/abseil-cpp/cmake/absl/)
#include(${CMAKE_CURRENT_SOURCE_DIR}/abseil-cpp/cmake/absl/abslConfig.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/abseil-cpp/abseil.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/filesystem-1.5.12/cmake/ghc_filesystem-config.cmake)



#add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/multichannel-audio-tools)
