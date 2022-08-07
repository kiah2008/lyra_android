# For more information about using CMake with Android Studio, read the
# documentation: https://d.android.com/studio/projects/add-native-code.html

# Sets the minimum version of CMake required to build the native library.

cmake_minimum_required(VERSION 3.16)

# Declares and names the project.

project(sparse_matmul_project VERSION 0.1.0)

# Creates and names a library, sets it as either STATIC
# or SHARED, and provides the relative paths to its source code.
# You can define multiple libraries, and CMake builds them for you.
# Gradle automatically packages shared libraries with your APK.

#add_library( # Sets the name of the library.
#        sparse_matmul
#
#        # Sets the library as a shared library.
#        SHARED
#
#        # Provides a relative path to your source file(s).
#        ${CMAKE_CURRENT_SOURCE_DIR}/compute/ar_inputs.h
#        )

# Searches for a specified prebuilt library and stores the path as a
# variable. Because CMake includes system libraries in the search path by
# default, you only need to specify the name of the public NDK library
# you want to add. CMake verifies that the library exists before
# completing its build.

#find_library( # Sets the name of the path variable.
#        log-lib
#
#        # Specifies the name of the NDK library that
#        # you want CMake to locate.
#        log)


# Specifies libraries CMake should link to your target library. You
# can link multiple libraries, such as libraries you define in this
# build script, prebuilt third-party libraries, or system libraries.
#
#target_link_libraries( # Specifies the target library.
#        nativelib
#
#        abseil_hdrs
#        # Links the target library to the log library
#        # included in the NDK.
#        ${log-lib})
#
#target_include_directories(nativelib
#        PRIVATE
#        ${CMAKE_CURRENT_SOURCE_DIR}/../liblyra/src/
#        ${CMAKE_CURRENT_SOURCE_DIR}/../liblyra/src/proto/
#        ${CMAKE_CURRENT_SOURCE_DIR}/../liblyra/libs/abseil-cpp/include/
#        ${CMAKE_CURRENT_SOURCE_DIR}/../liblyra/libs/glog-0.6.0/
#        ${CMAKE_CURRENT_SOURCE_DIR}/../liblyra/libs/protobuf-3.21.4/
#        ${CMAKE_CURRENT_SOURCE_DIR}/../liblyra/libs/filesystem-1.5.12/
#        )

MESSAGE(WARNING "========== computing")
add_subdirectory(compute)