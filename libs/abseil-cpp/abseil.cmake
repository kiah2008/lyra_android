set(ABSL_LIBS )

if (NOT EXISTS ${CMAKE_CURRENT_LIST_DIR}/include/)
    MESSAGE(FATAL_ERROR
            "not valid path ${CMAKE_CURRENT_LIST_DIR}")
endif()

#add_library(ABSL_INCLUD_DIR INTERFACE IMPORTED)
#set_target_properties(ABSL_INCLUD_DIR PROPERTIES
#        INTERFACE_INCLUDE_DIRECTORIES
#        ${CMAKE_CURRENT_LIST_DIR}/include/
#        )
set(ABSL_INCLUD_DIR ${CMAKE_CURRENT_LIST_DIR}/include/)

file(GLOB USER_LIBS_PATH ${CMAKE_CURRENT_LIST_DIR}/${ANDROID_ABI}/*.a)
foreach (f ${USER_LIBS_PATH})
#    message("file : ${f}")
    get_filename_component(filename ${f} NAME)
    string(LENGTH "${filename}" len)
#    message("filename: ${filename} , len: ${len}")
    math(EXPR sublen ${len}-3-2)
    string(SUBSTRING "${filename}" 3 ${sublen} libname)
#    message("abseil libname : ${libname}")
    add_library(${libname} STATIC IMPORTED )
    set_target_properties(${libname} PROPERTIES
        IMPORTED_LOCATION "${f}")

    list(APPEND ABSL_LIBS ${libname})
endforeach(f) 
