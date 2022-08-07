set(ABSL_LIBS )

file(GLOB USER_LIBS_PATH ${CMAKE_CURRENT_LIST_DIR}/libs/${ANDROID_ABI}/*.a)
foreach (f ${USER_LIBS_PATH})
    message("file : ${f}")
    get_filename_component(filename ${f} NAME)
    string(LENGTH "${filename}" len)
    message("filename: ${filename} , len: ${len}")
    math(EXPR sublen ${len}-3-2)
    string(SUBSTRING "${filename}" 3 ${sublen} libname)
    message("abseil libname : ${libname}")
    add_library(${libname} STATIC IMPORTED )
    set_target_properties(${libname} PROPERTIES
        IMPORTED_LOCATION "${f}") 
    set(ABSL_LIBS ${ABSL_LIBS} ${libname})
endforeach(f) 

set(ABSL_LIBS 
	absl_synchronization
	absl_symbolize
	absl_bad_any_cast_impl
	absl_bad_optional_access
	absl_bad_variant_access
	absl_base
	absl_city
	absl_civil_time
	absl_cord
	absl_debugging_internal
	absl_bad_any_cast_impl
	absl_bad_optional_access
	absl_bad_variant_access
	absl_base
	absl_city
	absl_civil_time
	absl_cord
	absl_debugging_internal
	absl_demangle_internal
	absl_dynamic_annotations
	absl_examine_stack
	absl_exponential_biased
	absl_failure_signal_handler
	absl_flags
	absl_flags_config
	absl_flags_handle
	absl_flags_internal
	absl_flags_marshalling
	absl_flags_parse
	absl_flags_program_name
	absl_flags_registry
	absl_flags_usage
	absl_flags_usage_internal
	absl_graphcycles_internal
	absl_hash
	absl_hashtablez_sampler
	absl_int128
	absl_leak_check
	absl_leak_check_disable
	absl_log_severity
	absl_malloc_internal
	absl_periodic_sampler
	absl_random_distributions
	absl_random_internal_distribution_test_util
	absl_random_internal_pool_urbg
	absl_random_internal_randen
	absl_random_internal_randen_hwaes
	absl_random_internal_randen_hwaes_impl
	absl_random_internal_randen_slow
	absl_random_internal_seed_material
	absl_random_seed_gen_exception
	absl_random_seed_sequences
	absl_raw_hash_set
	absl_raw_logging_internal
	absl_scoped_set_env
	absl_spinlock_wait
	absl_stacktrace
	absl_status
	absl_strerror
	absl_str_format_internal
	absl_strings
	absl_strings_internal
	absl_throw_delegate
	absl_time
	absl_time_zone
)
