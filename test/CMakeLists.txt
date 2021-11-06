FILE(GLOB TEST_FILES *.v)

foreach(file ${TEST_FILES})
    get_filename_component(barefile ${file} NAME_WE)
    message(STATUS testfile->${barefile})
    add_custom_command(
        OUTPUT ${barefile}.out
        COMMAND echo ==========================================
        COMMAND echo Build ${barefile}.out
        COMMAND iverilog ${CMAKE_CURRENT_SOURCE_DIR}/${barefile}.v ${DEPEND_DIR} -o ${barefile}.out
    )
    add_custom_target(${barefile} ALL DEPENDS ${barefile}.out)
endforeach()

