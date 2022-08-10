cmake_minimum_required(VERSION 3.16)
project(lyra_codec VERSION 0.1.0)

#include(CTest)
#enable_testing()

#add_subdirectory(libs/glog-0.6.0)
add_library(lyra-lib STATIC
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

        src/architecture_utils.h
        src/benchmark_decode.cc
        src/benchmark_decode_lib.cc
        src/benchmark_decode_lib.h
        src/buffer_merger.cc
        src/buffer_merger.h
        src/BUILD
        src/causal_convolutional_conditioning.h
        src/comfort_noise_generator.cc
        src/comfort_noise_generator.h
        src/CONTRIBUTING.md
        src/conv1d_layer_wrapper.h
        src/decoder_main.cc
        src/decoder_main_lib.cc
        src/decoder_main_lib.h
        src/denoiser_interface.h
        src/dilated_convolutional_layer_wrapper.h
        src/Doxyfile
        src/dsp_util.cc
        src/dsp_util.h
        src/encoder_main.cc
        src/encoder_main_lib.cc
        src/encoder_main_lib.h
        src/feature_extractor_interface.h
        src/filter_banks.cc
        src/filter_banks.h
        src/filter_banks_interface.h
        src/generative_model_interface.h
        src/gilbert_model.cc
        src/gilbert_model.h
        src/layer_wrapper.h
        src/layer_wrapper_interface.h
        src/layer_wrappers_lib.h
        src/LICENSE
        src/log_mel_spectrogram_extractor_impl.cc
        src/log_mel_spectrogram_extractor_impl.h
        src/log_mel_spectrogram_extractor_impl_benchmark.cc
        src/lyra_components.cc
        src/lyra_components.h
        src/lyra_config.cc
        src/lyra_config.h
        src/lyra_decoder.cc
        src/lyra_decoder.h
        src/lyra_decoder_interface.h
        src/lyra_encoder.cc
        src/lyra_encoder.h
        src/lyra_encoder_interface.h
        src/lyra_types.h
        src/lyra_wavegru.h
        src/naive_spectrogram_predictor.cc
        src/naive_spectrogram_predictor.h
        src/no_op_preprocessor.h
        src/noise_estimator.cc
        src/noise_estimator.h
        src/noise_estimator_interface.h
        src/packet.h
        src/packet_interface.h
        src/packet_loss_handler.cc
        src/packet_loss_handler.h
        src/packet_loss_handler_interface.h
        src/preprocessor_interface.h
        src/project_and_sample.h
        src/quadrature_mirror_filter.cc
        src/quadrature_mirror_filter.h
        src/README.md
        src/resampler.cc
        src/resampler.h
        src/resampler_interface.h
        src/spectrogram_predictor_interface.h
        src/transpose_convolutional_layer_wrapper.h
        src/vector_quantizer_impl.cc
        src/vector_quantizer_impl.h
        src/vector_quantizer_interface.h
        src/wav_util.cc
        src/wav_util.h
        src/wavegru_model_impl.cc
        src/wavegru_model_impl.h
        )

target_include_directories(lyra-lib
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
