
cmake_minimum_required(VERSION 3.10)
set(LIB_NAME "util_static")
project(${LIB_NAME})

#如果BUILD_SHARED_LIBS不设置，或者设置为FALSE,默认生成的是静态库
#如果设置为TRUE，则生成动态库
set(BUILD_SHARED_LIBS FALSE)

# 设置执行文件属性
set(SOURCE_FILES utils.c)

# 生成可执行文件
add_library(${LIB_NAME} ${SOURCE_FILES})

