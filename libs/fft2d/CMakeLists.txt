cmake_minimum_required(VERSION 3.16)
project("fft2d")

ADD_LIBRARY(fft2d
        ${CMAKE_CURRENT_SOURCE_DIR}/fft2d/alloc.c
        ${CMAKE_CURRENT_SOURCE_DIR}/fft2d/fftsg.c
        ${CMAKE_CURRENT_SOURCE_DIR}/fft2d/fftsg2d.c
        ${CMAKE_CURRENT_SOURCE_DIR}/fft2d/shrtdct.c
        )

set_target_properties(fft2d PROPERTIES
        INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_SOURCE_DIR}/fft2d/alloc.h"
        INTERFACE_LINK_LIBRARIES "\$<LINK_ONLY:m>"
        )
