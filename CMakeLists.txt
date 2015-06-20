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

enable_language(ASM)

# Toolchain cmake includes
include(${TOOLCHAIN_DIR}/toolchain.cmake)

# Library cmake includes
include(${LIBRARIES_DIR}/stm32f10x/stm32f10x.cmake)

# Programmer
include(${TOOLCHAIN_DIR}/stlink.cmake)


# Current directory includes
include_directories(${CMAKE_CURRENT_LIST_DIR})

# Set the parameters of the STM32F100VC
STM32_SET_PARAMS("256K" "24K" "0x20005f00" "0x1A00")

add_executable (
    ${CMAKE_PROJECT_NAME}.elf
    main.c
    startup_stm32f10x.c
)

target_link_libraries (
    ${CMAKE_PROJECT_NAME}.elf
    stm32f10x
)

