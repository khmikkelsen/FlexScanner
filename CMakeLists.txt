cmake_minimum_required(VERSION 3.7)
project(FlexScanner)

set(CMAKE_C_STANDARD 99)


FIND_PACKAGE(BISON REQUIRED)
SET(BisonOutput ${CMAKE_SOURCE_DIR}/parser.c)
IF(BISON_FOUND)
    ADD_CUSTOM_COMMAND(
            OUTPUT ${BisonOutput}
            COMMAND ${BISON_EXECUTABLE}
            -d
            ${CMAKE_SOURCE_DIR}/fb1-5.y
            COMMENT "Generating parser.c"
    )
ENDIF()

FIND_PACKAGE(FLEX REQUIRED)
SET(FlexOutput ${CMAKE_SOURCE_DIR}/scanner.c)
IF(FLEX_FOUND)
    ADD_CUSTOM_COMMAND(
            OUTPUT ${FlexOutput}
            COMMAND ${FLEX_EXECUTABLE}
            ${CMAKE_SOURCE_DIR}/fb1-5.l
            COMMENT "Generating fb1-5.l"
    )
ENDIF()

ADD_LIBRARY(main.c ${BisonOutput} ${FlexOutput})

add_executable(fb1-5
        ${BisonOutput}
        ${FlexOutput}
        test.l main.c)