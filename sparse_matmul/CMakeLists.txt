# For more information about using CMake with Android Studio, read the
# documentation: https://d.android.com/studio/projects/add-native-code.html

# Sets the minimum version of CMake required to build the native library.

cmake_minimum_required(VERSION 3.16)

# Declares and names the project.

project(sparse_matmul_project VERSION 0.1.0)


#add_library(sparse_matmul INTERFACE)
#set_target_properties(sparse_matmul
#        INTERFACE_INCLUDE_DIRECTORIES "sparse_matmul.h.h"
#        INTERFACE_LINK_LIBRARIES sparse_matmul
#        )

ADD_LIBRARY(sparse_matmul STATIC "")

TARGET_SOURCES(sparse_matmul
        PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/compute/ar_inputs.h
        ${CMAKE_CURRENT_SOURCE_DIR}/compute/gru_gates_arm.h
        ${CMAKE_CURRENT_SOURCE_DIR}/compute/gru_gates_avx_fixed.h
        ${CMAKE_CURRENT_SOURCE_DIR}/compute/gru_gates_generic.h
        ${CMAKE_CURRENT_SOURCE_DIR}/compute/matmul_fixed_avx2.cc
        ${CMAKE_CURRENT_SOURCE_DIR}/compute/matmul_fixed_avx2.h
        ${CMAKE_CURRENT_SOURCE_DIR}/compute/matmul_generic.cc
        ${CMAKE_CURRENT_SOURCE_DIR}/compute/matmul_generic.h

        ${CMAKE_CURRENT_SOURCE_DIR}/numerics/fast_transcendentals.cc
        ${CMAKE_CURRENT_SOURCE_DIR}/numerics/fast_transcendentals.h
        ${CMAKE_CURRENT_SOURCE_DIR}/numerics/fixed_types.h
        ${CMAKE_CURRENT_SOURCE_DIR}/numerics/float16_types.h
        ${CMAKE_CURRENT_SOURCE_DIR}/numerics/type_utils.h

        ${CMAKE_CURRENT_SOURCE_DIR}/vector/cache_aligned_vector.h


        ${CMAKE_CURRENT_SOURCE_DIR}/os/coop_threads.cc
        ${CMAKE_CURRENT_SOURCE_DIR}/os/coop_threads.h

        ${CMAKE_CURRENT_SOURCE_DIR}/zlib_wrapper/gzipheader.cc
        ${CMAKE_CURRENT_SOURCE_DIR}/zlib_wrapper/gzipheader.h
        ${CMAKE_CURRENT_SOURCE_DIR}/zlib_wrapper/zlibwrapper.cc
        ${CMAKE_CURRENT_SOURCE_DIR}/zlib_wrapper/zlibwrapper.h
        )

set_target_properties(sparse_matmul PROPERTIES
        INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_SOURCE_DIR}/compute;${CMAKE_CURRENT_SOURCE_DIR}/numerics; ${CMAKE_CURRENT_SOURCE_DIR}/layers"
        )

target_include_directories(
        sparse_matmul
        PRIVATE
        ${ABSL_INCLUD_DIR}
        ${GLOG_INCLUD_DIR}
)

target_link_libraries(
        sparse_matmul
        PUBLIC
        ${ABSL_LIBS}
        ${GLOG_LIBS}
        ghc_filesystem
)