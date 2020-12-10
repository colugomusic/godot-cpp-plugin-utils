include(${CMAKE_CURRENT_LIST_DIR}/info.cmake)

set(GODOT_CPP_ROOT SET_ME CACHE PATH "Should be set to the root of the godot-cpp repository")

if (${GODOT_CPP_ROOT} STREQUAL "SET_ME")
	message(FATAL "GODOT_CPP_ROOT needs to be set")
endif()

set(LIB_GODOT_CPP_PLATFORM $<IF:${ON_WINDOWS},windows,$<IF:${ON_MACOS},osx,linux>>)
set(LIB_GODOT_CPP_CONFIG $<IF:${DEBUG_BUILD},debug,release>)
set(GODOT_CPP_LIBRARY ${GODOT_CPP_ROOT}/bin/libgodot-cpp.${LIB_GODOT_CPP_PLATFORM}.${LIB_GODOT_CPP_CONFIG}.64${CMAKE_STATIC_LIBRARY_SUFFIX})

list(APPEND GODOT_CPP_INCLUDE_DIRS
	${GODOT_CPP_ROOT}/godot_headers
	${GODOT_CPP_ROOT}/include
	${GODOT_CPP_ROOT}/include/core
	${GODOT_CPP_ROOT}/include/gen
)
