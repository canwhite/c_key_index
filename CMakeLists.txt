# 指定cmake的最低版本
cmake_minimum_required(VERSION 3.10) 

# 定义你的项目名
set(APP_NAME "App")
project(${APP_NAME}) 

# 通过set整合要编译的执行文件，utils.c是你编写的util库的主要源文件，utils.h在start中引入
# set(SOURCE_FILES start.c utils/utils.c) 
set(SOURCE_FILES start.c)

# 注意指定有pc的相对路径，这就需要我们环境变量里导出PKG_CONFIG_PATH
set(ENV{PKG_CONFIG_PATH} "${CMAKE_SOURCE_DIR}/utils")
# 因为非常用预设路径如/usr/lib或/usr/local/lib，所以我们这里手动链接一下我们的库地址
link_directories(${CMAKE_SOURCE_DIR}/utils/lib)

find_package(PkgConfig REQUIRED)
pkg_check_modules(UTIL_STATIC REQUIRED util_static)


# 添加一个可执行文件的目标，名字是 MyProject，源代码文件是 SOURCE_FILES 变量存储的文件。
add_executable(${APP_NAME} ${SOURCE_FILES})

#往可执行文件上添加，所以tarhet，并使用pkg-config内部变量
target_include_directories(${APP_NAME} PRIVATE ${UTIL_STATIC_INCLUDE_DIRS})
target_link_libraries(${APP_NAME} ${UTIL_STATIC_LIBRARIES})



# ---使用静态库
# # 添加静态包执行静态和IMPORTED
# add_library(util_static STATIC IMPORTED)
# # 设置包属性，方便后边link
# set_target_properties(util_static PROPERTIES
#     IMPORTED_LOCATION ${CMAKE_SOURCE_DIR}/utils/libutil_static.a
# )
# # 引入字典目录，.h文件
# target_include_directories(${APP_NAME} PRIVATE ${CMAKE_SOURCE_DIR}/utils)
# # link
# target_link_libraries(${APP_NAME}  util_static)

# ---使用动态库
# add_library(util_dynamic SHARED IMPORTED)
# # dylib是macOS上的动态库后缀
# set_target_properties(util_dynamic PROPERTIES
#     IMPORTED_LOCATION ${CMAKE_SOURCE_DIR}/utils/libutil_static.dylib
# )
# target_include_directories(${APP_NAME} PRIVATE ${CMAKE_SOURCE_DIR}/utils)
# target_link_libraries(${APP_NAME}  util_dynamic)


# ---链接系统安装库
# 寻找并链接 CURL 库。如果没有找到，由于设置了 REQUIRED，CMake 会报告错误库
# find_package(CURL REQUIRED)

# # 将要使用的库文件和头文件目录链接到你的项目
# if(CURL_FOUND)
#   #将 CURL 的头文件目录加到编译器的头文件搜索路径中。  
#   include_directories(${CURL_INCLUDE_DIR})
#   #将 CURL 库链接到 MyProject 可执行文件。
#   target_link_libraries(MyProject ${CURL_LIBRARY})

# else(CURL_FOUND)
#   # 输出错误信息
#   message(FATAL_ERROR "CURL library not found")
  
# endif(CURL_FOUND)