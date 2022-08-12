
if (NOT Protobuf_LIBRARIES)
    MESSAGE(FATAL_ERROR "fail to find Protobuf_LIBRARIES")
endif()

add_library(lyra-config STATIC
        ${CMAKE_CURRENT_SOURCE_DIR}/lyra_config.pb.cc
        ${CMAKE_CURRENT_SOURCE_DIR}/lyra_config.pb.h
)

SET_TARGET_PROPERTIES(lyra-config PROPERTIES
        INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_SOURCE_DIR}/"
        )

target_link_libraries(lyra-config
        PUBLIC
        ${Protobuf_LIBRARIES}
        )
target_include_directories(lyra-config
        PUBLIC
        ${Protobuf_INCLUDE_DIRS}
)