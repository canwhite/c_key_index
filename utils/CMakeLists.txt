
cmake_minimum_required(VERSION 3.10)
#意思是最好把name给独立出来
set(LIB_NAME "util_static")
project(${LIB_NAME})
#如果BUILD_SHARED_LIBS不设置，或者设置为FALSE,默认生成的是静态库
#如果设置为TRUE，则生成动态库
set(BUILD_SHARED_LIBS FALSE)
set(SOURCE_FILES utils.c)
# 先添加库
add_library(${LIB_NAME} ${SOURCE_FILES})

# 设置.h为外部可见,TODO, 这个没起作用，所以从主文件引入的
# target_include_directories(${LIB_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})


