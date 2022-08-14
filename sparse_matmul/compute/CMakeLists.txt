# For more information about using CMake with Android Studio, read the
# documentation: https://d.android.com/studio/projects/add-native-code.html

# Sets the minimum version of CMake required to build the native library.

cmake_minimum_required(VERSION 3.16)

# Declares and names the project.

project("gru_gates")

# Creates and names a library, sets it as either STATIC
# or SHARED, and provides the relative paths to its source code.
# You can define multiple libraries, and CMake builds them for you.
# Gradle automatically packages shared libraries with your APK.

add_library( # Sets the name of the library.
        gru_gates

        # Sets the library as a shared library.
        STATIC

        # Provides a relative path to your source file(s).
        ar_inputs.h
        gru_gates_arm.h
        gru_gates_avx_fixed.h
        gru_gates_generic.h
        kernels_arm.h
        kernels_avx.h
        kernels_generic.h
        matmul_fixed_avx2.cc
        matmul_fixed_avx2.h
        matmul_generic.cc
        matmul_generic.h
        matmul.h

        thread_bounds.cc
        thread_bounds.h
        )

set_target_properties(
        gru_gates
        INTERFACE_INCLUDE_DIRECTORIES "gru_gates.h"
        INTERFACE_LINK_LIBRARIES glog-lib
)