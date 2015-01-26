cmake_minimum_required (VERSION 2.8.11)
project (Demo)

# Set the build definitions
SET(BUILD_DEFINITIONS_TARGET "-DSTM32F10X_HD_VL")
SET(BUILD_DEFINITIONS_DEBUG "-DSTM32F10X_HD_VL")
SET(BUILD_DEFINITIONS_RELEASE "-DSTM32F10X_HD_VL")

SET(TOOLCHAIN_DIR ${CMAKE_CURRENT_LIST_DIR}/toolchain)
SET(MODULES_DIR ${CMAKE_CURRENT_LIST_DIR}/modules)
SET(DRIVERS_DIR ${CMAKE_CURRENT_LIST_DIR}/drivers)
SET(LIBRARIES_DIR ${CMAKE_CURRENT_LIST_DIR}/libs)


# Toolchain cmake includes
include(${TOOLCHAIN_DIR}/toolchain.cmake)

# Library cmake includes
include(${LIBRARIES_DIR}/stm32f10x/stm32f10x.cmake)

# Modules cmake includes
#include(${MODULES_DIR}/event/event.cmake)




# Drivers cmake includes
#include(${DRIVERS_DIR}/captouch/captouch.cmake)


# Current directory includes
include_directories(${CMAKE_CURRENT_LIST_DIR})

link_directories(${CMAKE_CURRENT_BINARY_DIR})

# Set the parameters of the STM32F100VC
STM32_SET_PARAMS("256K" "24K" "0x20005f00" "0x1A00")

# Add executable
add_executable (
    ${CMAKE_PROJECT_NAME}.elf
    main.c
    startup_stm32f10x.c
)

target_link_libraries (
    ${CMAKE_PROJECT_NAME}.elf
    # Add libraries used in the project here

    stm32f10x

)
