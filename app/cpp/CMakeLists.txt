# For more information about using CMake with Android Studio, read the
# documentation: https://d.android.com/studio/projects/add-native-code.html

# Sets the minimum version of CMake required to build the native library.

cmake_minimum_required(VERSION 3.16)

# Declares and names the project.

project("lyra_android_example" LANGUAGES CXX)

# Searches for a specified prebuilt library and stores the path as a
# variable. Because CMake includes system libraries in the search path by
# default, you only need to specify the name of the public NDK library
# you want to add. CMake verifies that the library exists before
# completing its build.

find_library( # Sets the name of the path variable.
        log-lib

        # Specifies the name of the NDK library that
        # you want CMake to locate.
        log)

set(LYRA_LINK_LIBS
        ${ABSL_LIBS}

        ${GLOG_LIBS}
        # Links the target library to the log library
        # included in the NDK.
        ${log-lib}
        lyra-lib
        )

set(LYRA_INC_DIRS
        ${CMAKE_CURRENT_SOURCE_DIR}/../../liblyra/src/
        ${CMAKE_CURRENT_SOURCE_DIR}/../../liblyra/src/proto/
        ${CMAKE_CURRENT_SOURCE_DIR}/../../libs/protobuf-3.21.4/
        )
# Creates and names a library, sets it as either STATIC
# or SHARED, and provides the relative paths to its source code.
# You can define multiple libraries, and CMake builds them for you.
# Gradle automatically packages shared libraries with your APK.
add_executable(lyra_android_run
        benchmark_decode_run.cc
        )

target_link_libraries( # Specifies the target library.
        lyra_android_run
        ${LYRA_LINK_LIBS}
        )
target_include_directories(
        lyra_android_run
        PRIVATE
        ${LYRA_INC_DIRS}
)


add_library( # Sets the name of the library.
        lyra_android_example
        SHARED
        jni_benchmark_decode_lib.cc)

target_link_libraries( # Specifies the target library.
        lyra_android_example

        ${LYRA_LINK_LIBS}
        )

target_include_directories(lyra_android_example
        PRIVATE
        ${LYRA_INC_DIRS}
        )