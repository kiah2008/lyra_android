cmake_minimum_required(VERSION 3.16)
project("lyra demo libs")

#find_package(protobuf REQUIRED)

#install(TARGETS glog_lib  LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}/libs/${ANDROID_ABI})
ADD_SUBDIRECTORY(hello_world)
ADD_SUBDIRECTORY(fft2d)
ADD_SUBDIRECTORY(gulrak_filesystem)
#ADD_SUBDIRECTORY(eigen_archive)
ADD_SUBDIRECTORY(com_google_audio_dsp)

#add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/multichannel-audio-tools)
