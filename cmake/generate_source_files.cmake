foreach(source ${SOURCES})
	if(EXISTS ${source})
		list(APPEND SOURCE_FILES ${source})
	else()
		set(potential_header ${CMAKE_CURRENT_SOURCE_DIR}/src/${source}.h)
		set(potential_cpp ${CMAKE_CURRENT_SOURCE_DIR}/src/${source}.cpp)

		if(EXISTS ${potential_header})
			list(APPEND HEADERS ${potential_header})
			list(APPEND SOURCE_FILES ${potential_header})
		endif()

		if(EXISTS ${potential_cpp})
			list(APPEND SRC ${potential_cpp})
			list(APPEND SOURCE_FILES ${potential_cpp})
		endif()
	endif()
endforeach()

set(potential_classes_list ${CMAKE_CURRENT_SOURCE_DIR}/classes.cmake)

if (EXISTS ${potential_classes_list})
	list(APPEND SOURCE_FILES ${potential_classes_list})
endif()
