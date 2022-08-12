set(GLOG_LIBS )

file(GLOB _glog_user_libs_path ${CMAKE_CURRENT_LIST_DIR}/${ANDROID_ABI}/*.a)
foreach (f ${_glog_user_libs_path})
    get_filename_component(filename ${f} NAME)
    string(LENGTH "${filename}" len)
    math(EXPR sublen ${len}-3-2)
    string(SUBSTRING "${filename}" 3 ${sublen} libname)
    add_library(${libname} STATIC IMPORTED )
    set_target_properties(${libname} PROPERTIES
        IMPORTED_LOCATION "${f}")

    list(APPEND GLOG_LIBS ${libname})
endforeach(f) 

set(GLOG_INCLUD_DIR ${CMAKE_CURRENT_LIST_DIR}/)
