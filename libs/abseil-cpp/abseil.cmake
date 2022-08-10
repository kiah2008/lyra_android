set(ABSL_LIBS )

add_library(ABSL_INCLUD_DIR INTERFACE)
target_include_directories(
        ABSL_INCLUD_DIR
		INTERFACE
		${CMAKE_CURRENT_SOURCE_DIR}/abseil-cpp/include/
)

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
