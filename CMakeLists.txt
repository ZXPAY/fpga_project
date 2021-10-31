cmake_minimum_required(VERSION 3.16)

project(fpga_project)

file(GLOB VERILOG_SRC
    ${CMAKE_SOURCE_DIR}/module/*.v
    )

message(STATUS ${VERILOG_SRC})

function(verilog_build_case name)
    add_custom_command(
        OUTPUT ${name}.out
        COMMAND echo ==========================================
        COMMAND echo Build ${name}.out
        COMMAND iverilog ${VERILOG_SRC} -o ${name}.out
        COMMAND vvp ${name}.out
        COMMAND echo ==========================================
    )
    add_custom_target(${name} ALL DEPENDS ${name}.out)
endfunction()


# build the test
verilog_build_case(${PROJECT_NAME})

