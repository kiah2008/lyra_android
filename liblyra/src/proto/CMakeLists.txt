
if (NOT Protobuf_LIBRARIES)
    MESSAGE(FATAL_ERROR "fail to find Protobuf_LIBRARIES")
endif()

add_library(lyra_config STATIC
        ${CMAKE_CURRENT_SOURCE_DIR}/lyra_config.pb.cc
        ${CMAKE_CURRENT_SOURCE_DIR}/lyra_config.pb.h
)

target_link_libraries(lyra_config
        PUBLIC
        ${Protobuf_LIBRARIES}
        )
target_include_directories(lyra_config
        PUBLIC
        ${protobuf_INCLUDE_DIR}
)