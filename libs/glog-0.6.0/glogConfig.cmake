set(GLOG_LIBS )

add_library(GLOG_INCLUD_DIRS INTERFACE)
target_include_directories(
        GLOG_INCLUD_DIRS
		INTERFACE
		${CMAKE_CURRENT_SOURCE_DIR}/abseil-cpp/include/
)

file(GLOB USER_LIBS_PATH ${CMAKE_CURRENT_LIST_DIR}/${ANDROID_ABI}/*.a)
foreach (f ${USER_LIBS_PATH})
    get_filename_component(filename ${f} NAME)
    string(LENGTH "${filename}" len)
    math(EXPR sublen ${len}-3-2)
    string(SUBSTRING "${filename}" 3 ${sublen} libname)
    add_library(${libname} STATIC IMPORTED )
    set_target_properties(${libname} PROPERTIES
        IMPORTED_LOCATION "${f}")

    list(APPEND GLOG_LIBS ${libname})
endforeach(f) 
