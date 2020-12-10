set(PROJECT_ROOT ${CMAKE_CURRENT_BINARY_DIR}/project CACHE PATH "Project root directory")
set(PLUGIN_INSTALL_PREFIX plugins CACHE STRING "Plugin install prefix")
set(CMAKE_INSTALL_PREFIX ${PROJECT_ROOT}/${PLUGIN_INSTALL_PREFIX} CACHE PATH "CMake install prefix" FORCE)

configure_file(library.gdnlib.input library.gdnlib.output)

install(FILES ${CMAKE_CURRENT_BINARY_DIR}/library.gdnlib.output
	DESTINATION ${CMAKE_PROJECT_NAME}/bin
	RENAME ${CMAKE_PROJECT_NAME}.gdnlib
)

install(TARGETS ${PROJECT_NAME}
	DESTINATION ${CMAKE_PROJECT_NAME}/bin/${PLATFORM_DIR}
)

foreach(class ${CLASSES})
	set(CLASS_NAME ${class})
	configure_file(${CMAKE_CURRENT_LIST_DIR}/class.gdns.input ${class}.gdns.output)
	install(FILES ${CMAKE_CURRENT_BINARY_DIR}/${class}.gdns.output
		DESTINATION ${CMAKE_PROJECT_NAME}/bin
		RENAME ${class}.gdns
	)
endforeach()
