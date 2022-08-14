# absl CMake configuration file.

include(CMakeFindDependencyMacro)
find_dependency(Threads)


####### Expanded from @PACKAGE_INIT@ by configure_package_config_file() #######
####### Any changes to this file will be overwritten by the next CMake run ####
####### The input file was abslConfig.cmake.in                            ########

get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../" ABSOLUTE)

macro(set_and_check _var _file)
    set(${_var} "${_file}")
    if (NOT EXISTS "${_file}")
        message(FATAL_ERROR "File or directory ${_file} referenced by variable ${_var} does not exist !")
    endif ()
endmacro()

macro(check_required_components _NAME)
    foreach (comp ${${_NAME}_FIND_COMPONENTS})
        if (NOT ${_NAME}_${comp}_FOUND)
            if (${_NAME}_FIND_REQUIRED_${comp})
                set(${_NAME}_FOUND FALSE)
            endif ()
        endif ()
    endforeach ()
endmacro()

####################################################################################

include("${CMAKE_CURRENT_LIST_DIR}/abslTargets.cmake")

if (NOT TARGET absl::bad_any_cast_impl)
    MESSAGE(FATAL_ERROR
            "fail to found target absl::absl_bad_any_cast_impl"
            )
endif ()

set(ABSL_LIBS
        absl::atomic_hook
        absl::errno_saver
        absl::log_severity
        absl::raw_logging_internal
        absl::spinlock_wait
        absl::config
        absl::dynamic_annotations
        absl::core_headers
        absl::malloc_internal
        absl::base_internal
        absl::base
        absl::throw_delegate
        absl::pretty_function
        absl::endian
        absl::scoped_set_env
        absl::strerror
        absl::fast_type_id absl::prefetch
        absl::algorithm
        absl::algorithm_container
        absl::cleanup_internal
        absl::cleanup
        absl::btree
        absl::compressed_tuple
        absl::fixed_array
        absl::inlined_vector_internal
        absl::inlined_vector
        absl::counting_allocator
        absl::flat_hash_map
        absl::flat_hash_set
        absl::node_hash_map
        absl::node_hash_set
        absl::container_memory
        absl::hash_function_defaults
        absl::hash_policy_traits
        absl::hashtablez_sampler
        absl::hashtable_debug
        absl::hashtable_debug_hooks
        absl::node_slot_policy
        absl::raw_hash_map
        absl::container_common
        absl::raw_hash_set
        absl::layout
        absl::stacktrace
        absl::symbolize
        absl::examine_stack
        absl::failure_signal_handler
        absl::debugging_internal
        absl::demangle_internal
        absl::leak_check
        absl::debugging
        absl::flags_path_util
        absl::flags_program_name
        absl::flags_config
        absl::flags_marshalling
        absl::flags_commandlineflag_internal
        absl::flags_commandlineflag
        absl::flags_private_handle_accessor
        absl::flags_reflection
        absl::flags_internal
        absl::flags absl::flags_usage_internal
        absl::flags_usage
        absl::flags_parse
        absl::any_invocable
        absl::bind_front
        absl::function_ref
        absl::hash
        absl::city
        absl::low_level_hash
        absl::memory
        absl::type_traits
        absl::meta
        absl::bits
        absl::int128
        absl::numeric
        absl::numeric_representation
        absl::sample_recorder
        absl::exponential_biased
        absl::periodic_sampler
        absl::random_random
        absl::random_bit_gen_ref
        absl::random_internal_mock_helpers
        absl::random_distributions
        absl::random_seed_gen_exception
        absl::random_seed_sequences
        absl::random_internal_traits
        absl::random_internal_distribution_caller
        absl::random_internal_fast_uniform_bits
        absl::random_internal_seed_material
        absl::random_internal_pool_urbg
        absl::random_internal_salted_seed_seq
        absl::random_internal_iostream_state_saver
        absl::random_internal_generate_real
        absl::random_internal_wide_multiply
        absl::random_internal_fastmath
        absl::random_internal_nonsecure_base
        absl::random_internal_pcg_engine
        absl::random_internal_randen_engine
        absl::random_internal_platform
        absl::random_internal_randen
        absl::random_internal_randen_slow
        absl::random_internal_randen_hwaes
        absl::random_internal_randen_hwaes_impl
        absl::random_internal_distribution_test_util
        absl::random_internal_uniform_helper
        absl::status
        absl::statusor
        absl::strings
        absl::strings_internal
        absl::str_format
        absl::str_format_internal
        absl::cord_internal
        absl::cordz_update_tracker
        absl::cordz_functions
        absl::cordz_statistics
        absl::cordz_handle
        absl::cordz_info
        absl::cordz_sample_token
        absl::cordz_update_scope
        absl::cord
        absl::graphcycles_internal
        absl::kernel_timeout_internal
        absl::synchronization
        absl::time
        absl::civil_time
        absl::time_zone
        absl::any
        absl::bad_any_cast
        absl::bad_any_cast_impl
        absl::span
        absl::optional
        absl::bad_optional_access
        absl::bad_variant_access
        absl::variant
        absl::compare
        absl::utility
        )
