cmake_minimum_required(VERSION 3.16)
project(lyra_codec VERSION 0.1.0)

#include(CTest)
#enable_testing()

#add_subdirectory(libs/glog-0.6.0)
add_library(lyra_export STATIC
        src/decoder_main.cc
        src/decoder_main_lib.cc
        src/decoder_main_lib.h
        src/encoder_main.cc
        src/encoder_main_lib.cc
        src/encoder_main_lib.h
        src/lyra_components.h
        src/lyra_config.h
        src/lyra_decoder.cc
        src/lyra_decoder.h
        src/lyra_encoder.cc
        src/lyra_encoder.h
        )

target_include_directories(lyra_export
        PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/src/
        ${CMAKE_CURRENT_SOURCE_DIR}/src/proto/
        ${CMAKE_CURRENT_SOURCE_DIR}/../
        ${CMAKE_CURRENT_SOURCE_DIR}/../libs/abseil-cpp/include/
        ${CMAKE_CURRENT_SOURCE_DIR}/../libs/glog-0.6.0/
        ${CMAKE_CURRENT_SOURCE_DIR}/../libs/protobuf-3.21.4/
        ${CMAKE_CURRENT_SOURCE_DIR}/../libs/filesystem-1.5.12/
        ${CMAKE_CURRENT_SOURCE_DIR}/../libs/multichannel-audio-tools/
        ${CMAKE_CURRENT_SOURCE_DIR}/../libs/eigen-3.4.0/include/eigen3/
        ${CMAKE_CURRENT_SOURCE_DIR}/../libs/multichannel-audio-tools/third_party/fft2d
        ${CMAKE_CURRENT_SOURCE_DIR}/../libs/multichannel-audio-tools/third_party/kissfft
        )

# shared lib

#add_library(lyra_codec comfort_noise_generator.cc)

add_library(architecture_utils INTERFACE)
target_include_directories(
        architecture_utils
        INTERFACE
        src/architecture_utils.h
)

add_library(layer_wrapper_interface INTERFACE)
target_include_directories(
        layer_wrapper_interface
        INTERFACE
        src/layer_wrapper_interface.h
)

add_library(layer_wrapper INTERFACE)
target_include_directories(
        layer_wrapper
        INTERFACE
        src/layer_wrapper.h
)
target_link_libraries(layer_wrapper INTERFACE
        layer_wrapper_interface
        )



#set(CPACK_PROJECT_NAME ${PROJECT_NAME})
#set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
#include(CPack)
