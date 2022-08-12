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

endif()

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/src)

#set(CPACK_PROJECT_NAME ${PROJECT_NAME})
#set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
#include(CPack)
