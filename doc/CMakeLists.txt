include("${CMAKE_SOURCE_DIR}/cmake/UseLATEX.cmake")
SET(LATEX_OUTPUT_PATH build)

file(GLOB_RECURSE contents_files RELATIVE ${CMAKE_SOURCE_DIR} doc/*.tex)


file(GLOB LATEX_SRC
"${CMAKE_SOURCE_DIR}/contents/*.tex"
)  
message(STATUS "Found latex: ${LATEX_SRC}")

add_latex_document(
    master.tex
    INPUTS ${contents_files}
    IMAGE_DIRS images
    USE_INDEX
    USE_GLOSSARY
)
