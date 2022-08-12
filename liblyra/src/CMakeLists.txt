cmake_minimum_required(VERSION 3.16)
project(lyra_codec VERSION 0.1.0)

#include(CTest)
#enable_testing()
if (NOT TARGET ${log-lib})

    find_library( # Sets the name of the path variable.
            log-lib

            # Specifies the name of the NDK library that
            # you want CMake to locate.
            log)

endif ()

add_library(architecture_utils INTERFACE IMPORTED)
set_target_properties(architecture_utils PROPERTIES
        INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_SOURCE_DIR}"
        INTERFACE_LINK_LIBRARIES ghc_filesystem
        )


add_library(layer_wrapper_interface INTERFACE IMPORTED)
set_target_properties(layer_wrapper_interface PROPERTIES
        INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_SOURCE_DIR}"
        INTERFACE_LINK_LIBRARIES sparse_matmul
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

#
#target_link_libraries(lyra_config
#        PUBLIC
#        ${Protobuf_LIBRARIES}
#        )
#target_include_directories(lyra_config
#        PUBLIC
#        ${protobuf_INCLUDE_DIR}
#        )

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/proto)

ADD_LIBRARY(lyra-lib STATIC
        decoder_main.cc
        decoder_main_lib.cc
        decoder_main_lib.h
        encoder_main.cc
        encoder_main_lib.cc
        encoder_main_lib.h
        lyra_components.h
        lyra_decoder.cc
        lyra_decoder.h
        lyra_encoder.cc
        lyra_encoder.h

        lyra_config.cc
        lyra_config.h

        lyra_components.cc
        lyra_components.h

        resampler.cc
        resampler.h
        resampler_interface.h

        packet_loss_handler.cc
        packet_loss_handler.h
        packet_loss_handler_interface.h

        wav_util.cc
        wav_util.h

        benchmark_decode_lib.cc
        benchmark_decode_lib.h

        log_mel_spectrogram_extractor_impl.cc
        log_mel_spectrogram_extractor_impl.h

        wavegru_model_impl.cc
        wavegru_model_impl.h

        buffer_merger.cc
        buffer_merger.h

        comfort_noise_generator.cc
        comfort_noise_generator.h
        )

TARGET_LINK_LIBRARIES(
        lyra-lib
        PUBLIC
        ${Protobuf_LIBRARIES}
        ${ABSL_LIBS}
        ${GLOG_LIBS}
        ghc_filesystem
        lyra-config
        audio_dsp_hdr
        audio_dsp
)

TARGET_INCLUDE_DIRECTORIES(
        lyra-lib
        PUBLIC
        ${Protobuf_INCLUDE_DIRS}
        ${ABSL_INCLUD_DIR}
        ${GLOG_INCLUD_DIR}
        ${EIGEN3_INCLUDE_DIRS}
)


