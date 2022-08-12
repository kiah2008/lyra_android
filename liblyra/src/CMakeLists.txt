add_library(architecture_utils INTERFACE IMPORTED)
set_target_properties(architecture_utils
        INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_SOURCE_DIR}"
        INTERFACE_LINK_LIBRARIES ghc_filesystem
        )


add_library(layer_wrapper_interface INTERFACE)
set_target_properties(layer_wrapper_interface
        INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_SOURCE_DIR}"
        INTERFACE_LINK_LIBRARIES sparse_matmul
        )

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


add_library(architecture_utils STATIC
        )

set_target_properties(protobuf::libprotobuf PROPERTIES
        INTERFACE_INCLUDE_DIRECTORIES "${PACKAGE_PREFIX}/"
        INTERFACE_LINK_LIBRARIES "\$<LINK_ONLY:-pthread>;\$<LINK_ONLY:ZLIB::ZLIB>;\$<LINK_ONLY:log>"
        )


target_link_libraries(lyra_config
        PUBLIC
        ${Protobuf_LIBRARIES}
        )
target_include_directories(lyra_config
        PUBLIC
        ${protobuf_INCLUDE_DIR}
        )

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/proto)
