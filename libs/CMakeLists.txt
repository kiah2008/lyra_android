
add_library(glog-lib SHARED IMPORTED)
set_target_properties(glog-lib PROPERTIES IMPORTED_LOCATION
        ${CMAKE_CURRENT_SOURCE_DIR}/glog-0.6.0/${ANDROID_ABI}/libglog.so)

add_library(glog_hdrs INTERFACE)
target_include_directories(
        glog_hdrs
        INTERFACE
        ${CMAKE_CURRENT_SOURCE_DIR}//glog-0.6.0/
)

include(${CMAKE_CURRENT_SOURCE_DIR}/abseil-cpp/cmake/absl/abslConfig.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/filesystem-1.5.12/cmake/ghc_filesystem-config.cmake)

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/multichannel-audio-tools)
