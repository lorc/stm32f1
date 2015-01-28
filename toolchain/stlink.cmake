
add_custom_target(flash DEPENDS ${CMAKE_PROJECT_NAME}.bin COMMAND st-flash write --reset ${CMAKE_PROJECT_NAME}.bin 0x8000000)
add_custom_target(erase  COMMAND st-flash erase)