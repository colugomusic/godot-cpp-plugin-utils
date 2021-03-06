set(PROJECT_ROOT ${CMAKE_CURRENT_BINARY_DIR}/project CACHE PATH "Project root directory")
set(BIN_OUTPUT_DIR ${PROJECT_ROOT}/${PLUGIN_INSTALL_PREFIX}/${PROJECT_NAME}/bin)
set(BIN_PLATFORM_DIR ${BIN_OUTPUT_DIR}/${PLATFORM_DIR})

configure_file(library.gdnlib.input ${BIN_OUTPUT_DIR}/${PROJECT_NAME}.gdnlib)

set_target_properties(${PROJECT_NAME} PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY_DEBUG ${BIN_PLATFORM_DIR}
    RUNTIME_OUTPUT_DIRECTORY_RELEASE ${BIN_PLATFORM_DIR}
    RUNTIME_OUTPUT_DIRECTORY ${BIN_PLATFORM_DIR}
    LIBRARY_OUTPUT_DIRECTORY_DEBUG ${BIN_PLATFORM_DIR}
    LIBRARY_OUTPUT_DIRECTORY_RELEASE ${BIN_PLATFORM_DIR}
    LIBRARY_OUTPUT_DIRECTORY ${BIN_PLATFORM_DIR}
)

foreach(class ${CLASSES})
	set(CLASS_NAME ${class})
	configure_file(${CMAKE_CURRENT_LIST_DIR}/class.gdns.input ${BIN_OUTPUT_DIR}/${class}.gdns)
endforeach()