cmake_minimum_required(VERSION 3.16)
project("lyra demo libs")

#install(TARGETS glog_lib  LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}/libs/${ANDROID_ABI})
ADD_SUBDIRECTORY(hello_world)

#add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/multichannel-audio-tools)
