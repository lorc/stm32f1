cmake_minimum_required (VERSION 2.8.11)
project (Demo)

# Set the build definitions
SET(BUILD_DEFINITIONS_TARGET "-DSTM32F10X_HD_VL")
SET(BUILD_DEFINITIONS_DEBUG "")
SET(BUILD_DEFINITIONS_RELEASE "")

SET(TOOLCHAIN_DIR ${CMAKE_CURRENT_LIST_DIR}/toolchain)
SET(MODULES_DIR ${CMAKE_CURRENT_LIST_DIR}/modules)
SET(DRIVERS_DIR ${CMAKE_CURRENT_LIST_DIR}/drivers)
SET(LIBRARIES_DIR ${CMAKE_CURRENT_LIST_DIR}/libs)


# Toolchain cmake includes
include(${TOOLCHAIN_DIR}/toolchain.cmake)

# Library cmake includes
include(${LIBRARIES_DIR}/stm32f10x/stm32f10x.cmake)

# Programmer
include(${TOOLCHAIN_DIR}/stlink.cmake)


# Current directory includes
include_directories(${CMAKE_CURRENT_LIST_DIR})

link_directories(${CMAKE_CURRENT_BINARY_DIR})

# Add executable
add_executable (
    ${CMAKE_PROJECT_NAME}.elf
    ${LIBRARIES_DIR}/stm32f10x/system_stm32f10x.c
    main.c
    startup_stm32f10x.c
)

target_link_libraries (
    ${CMAKE_PROJECT_NAME}.elf
    # Add libraries used in the project here

    stm32f10x

)
