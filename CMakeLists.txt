cmake_minimum_required(VERSION 3.16)

project(fpga_project)


add_subdirectory("doc")

set(DEPEND_DIR
    ${CMAKE_SOURCE_DIR}
    ${CMAKE_SOURCE_DIR}/module
)


file(GLOB VERILOG_SRC
    "${CMAKE_SOURCE_DIR}/module/*.v"
    )

function (add_prefix var pfix lst)
    foreach(i ${lst})
        set (f ${f} ${pfix}${i})
    endforeach()
    set (${var} ${f} PARENT_SCOPE)
endfunction()

add_prefix(DEPEND_DIR -I "${DEPEND_DIR}")



add_subdirectory(test)
