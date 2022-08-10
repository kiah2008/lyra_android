# absl CMake configuration file.

include(CMakeFindDependencyMacro)
find_dependency(Threads)


####### Expanded from @PACKAGE_INIT@ by configure_package_config_file() #######
####### Any changes to this file will be overwritten by the next CMake run ####
####### The input file was abslConfig.cmake.in                            ########

get_filename_component(PACKAGE_PREFIX_DIR ${CMAKE_CURRENT_LIST_DIR}/../.. ABSOLUTE)

macro(set_and_check _var _file)
  set(${_var} "${_file}")
  if(NOT EXISTS "${_file}")
    message(FATAL_ERROR "File or directory ${_file} referenced by variable ${_var} does not exist !")
  endif()
endmacro()

macro(check_required_components _NAME)
  foreach(comp ${${_NAME}_FIND_COMPONENTS})
    if(NOT ${_NAME}_${comp}_FOUND)
      if(${_NAME}_FIND_REQUIRED_${comp})
        set(${_NAME}_FOUND FALSE)
      endif()
    endif()
  endforeach()
endmacro()

####################################################################################

include (${CMAKE_CURRENT_LIST_DIR}/abslTargets.cmake)

set(ABSL_LIBS
        absl::absl_synchronization
        absl::absl_symbolize
        absl::absl_bad_any_cast_impl
        absl::absl_bad_optional_access
        absl::absl_bad_variant_access
        absl::absl_base
        absl::absl_city
        absl::absl_civil_time
        absl::absl_cord
        absl::absl_debugging_internal
        absl::absl_bad_any_cast_impl
        absl::absl_bad_optional_access
        absl::absl_bad_variant_access
        absl::absl_base
        absl::absl_city
        absl::absl_civil_time
        absl::absl_cord
        absl::absl_debugging_internal
        absl::absl_demangle_internal
        absl::absl_dynamic_annotations
        absl::absl_examine_stack
        absl::absl_exponential_biased
        absl::absl_failure_signal_handler
        absl::absl_flags
        absl::absl_flags_config
        absl::absl_flags_handle
        absl::absl_flags_internal
        absl::absl_flags_marshalling
        absl::absl_flags_parse
        absl::absl_flags_program_name
        absl::absl_flags_registry
        absl::absl_flags_usage
        absl::absl_flags_usage_internal
        absl::absl_graphcycles_internal
        absl::absl_hash
        absl::absl_hashtablez_sampler
        absl::absl_int128
        absl::absl_leak_check
        absl::absl_leak_check_disable
        absl::absl_log_severity
        absl::absl_malloc_internal
        absl::absl_periodic_sampler
        absl::absl_random_distributions
        absl::absl_random_internal_distribution_test_util
        absl::absl_random_internal_pool_urbg
        absl::absl_random_internal_randen
        absl::absl_random_internal_randen_hwaes
        absl::absl_random_internal_randen_hwaes_impl
        absl::absl_random_internal_randen_slow
        absl::absl_random_internal_seed_material
        absl::absl_random_seed_gen_exception
        absl::absl_random_seed_sequences
        absl::absl_raw_hash_set
        absl::absl_raw_logging_internal
        absl::absl_scoped_set_env
        absl::absl_spinlock_wait
        absl::absl_stacktrace
        absl::absl_status
        absl::absl_strerror
        absl::absl_str_format_internal
        absl::absl_strings
        absl::absl_strings_internal
        absl::absl_throw_delegate
        absl::absl_time
        absl::absl_time_zone
        )
