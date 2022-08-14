# For more information about using CMake with Android Studio, read the
# documentation: https://d.android.com/studio/projects/add-native-code.html

# Sets the minimum version of CMake required to build the native library.

cmake_minimum_required(VERSION 3.16)

# Declares and names the project.

project("audio_dsp")

## Creates and names a library, sets it as either STATIC
## or SHARED, and provides the relative paths to its source code.
## You can define multiple libraries, and CMake builds them for you.
## Gradle automatically packages shared libraries with your APK.
#
#add_library( # Sets the name of the library.
#        audio_dsp
#
#        # Sets the library as a shared library.
#        SHARED
#
#        # Provides a relative path to your source file(s).
#        jni_benchmark_decode_lib.cc)
#
## Searches for a specified prebuilt library and stores the path as a
## variable. Because CMake includes system libraries in the search path by
## default, you only need to specify the name of the public NDK library
## you want to add. CMake verifies that the library exists before
## completing its build.
#
#find_library( # Sets the name of the path variable.
#        log-lib
#
#        # Specifies the name of the NDK library that
#        # you want CMake to locate.
#        log)
#
#
## Specifies libraries CMake should link to your target library. You
## can link multiple libraries, such as libraries you define in this
## build script, prebuilt third-party libraries, or system libraries.
#
#target_link_libraries( # Specifies the target library.
#        nativelib
#
#        abseil_hdrs
#        lyra_export
#        # Links the target library to the log library
#        # included in the NDK.
#        ${log-lib})
#
#target_include_directories(nativelib
#        PRIVATE
#        ../../liblyra/src
#        ../../liblyra/src/proto
#        ../abseil-cpp/include
#        ../glog-0.6.0
#        ../protobuf-3.21.4
#        ../../external_libs/filesystem-1.5.12
#        )

#cmake -B./build  -S . -DCMAKE_INSTALL_PREFIX=./build/release -DANDROID_ABI=arm64-v8a -DANDROID_PLATFORM=android-29 -DANDROID_NDK=c:\Users\kiah\AppData\Local\Android\Sdk\ndk\20.1.5948944 -DCMAKE_TOOLCHAIN_FILE=c:\Users\kiah\AppData\Local\Android\Sdk\ndk\20.1.5948944\build\cmake\android.toolchain.cmake -DCMAKE_HOST_SYSTEM_NAME=Windows -G Ninja -DEIGEN_TEST_CXX11=ON

add_library(audio_dsp_hdr INTERFACE)
set_target_properties(audio_dsp_hdr PROPERTIES
        INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_SOURCE_DIR}"
        )

add_library(audio_dsp STATIC
        audio/dsp/portable/read_wav_file.c
        audio/dsp/portable/read_wav_file.h
        audio/dsp/portable/read_wav_file_generic.c
        audio/dsp/portable/read_wav_file_generic.h
        audio/dsp/portable/read_wav_info.h
        audio/dsp/portable/write_wav_file.c
        audio/dsp/portable/write_wav_file.h
        audio/dsp/portable/write_wav_file_generic.c
        audio/dsp/portable/write_wav_file_generic.h
        audio/dsp/portable/write_wav_string.cc
        audio/dsp/portable/write_wav_string.h
        audio/dsp/portable/number_util.c
        audio/dsp/portable/number_util.h
        audio/dsp/portable/rational_factor_resampler_kernel.c
        audio/dsp/portable/rational_factor_resampler_kernel.h

        audio/dsp/spectrogram/spectrogram.cc
        audio/dsp/spectrogram/spectrogram.h
        audio/dsp/spectrogram/inverse_spectrogram.cc

        audio/dsp/number_util.cc
        audio/dsp/number_util.h

        audio/dsp/porting.cc
        audio/dsp/window_functions.cc
        audio/dsp/window_functions.h
        audio/dsp/types.h
        audio/dsp/bessel_functions.cc
        audio/dsp/bessel_functions.h

        audio/dsp/mfcc/mel_filterbank.h
        audio/dsp/mfcc/mel_filterbank.cc

        audio/dsp/resampler_q.cc
        audio/dsp/resampler_q.h

        audio/dsp/portable/rational_factor_resampler_kernel.c
        audio/dsp/portable/rational_factor_resampler_kernel.h
        )

target_link_libraries(
        audio_dsp
        PRIVATE
        audio_dsp_hdr
        Eigen3::Eigen
        ${GLOG_LIBS}
        ${ABSL_LIBS}
)