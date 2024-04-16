# 指定cmake的最低版本
cmake_minimum_required(VERSION 3.10) 

# 定义你的项目名
set(APP_NAME "App")
project(${APP_NAME}) 

set(SOURCE_FILES start.c)

# ----------------自写静态库的引入使用----------------
# pre: 手动和目标导入都需要，因为是我们自己实现的静态库，不在系统默认查找位置，
# 所以：注意指定有pc的相对路径，这就需要我们环境变量里导出PKG_CONFIG_PATH
set(ENV{PKG_CONFIG_PATH} "${CMAKE_SOURCE_DIR}/utils")

# 1. 手动版---pc文件中prefix可以使用.相对位置

# link_directories(${CMAKE_SOURCE_DIR}/utils/lib)
# # 整体来说，这种全局的容错性更强
# include_directories(${CMAKE_SOURCE_DIR}/utils/include)
# find_package(PkgConfig REQUIRED)
# pkg_check_modules(UTIL_STATIC REQUIRED  util_static)
# add_executable(${APP_NAME} ${SOURCE_FILES}) 
# target_link_libraries(${APP_NAME} ${UTIL_STATIC_LIBRARIES})

# 2.导入目标版(推荐)---pc文件中prefix要用绝对位置
find_package(PkgConfig REQUIRED)
pkg_check_modules(UTIL_STATIC REQUIRED IMPORTED_TARGET util_static)
add_executable(${APP_NAME} ${SOURCE_FILES}) 
target_link_libraries(${APP_NAME} PkgConfig::UTIL_STATIC)


# ----------------系统库的引入使用----------------

# 1.curl引入方法一，手动导入

# find_package(PkgConfig REQUIRED)
# pkg_check_modules(CURL REQUIRED libcurl)
# add_executable(${APP_NAME} ${SOURCE_FILES})
# #注意include_directories 是全局引入的意思，系统库一般用它，以便其他库也能发现它的.h文件
# include_directories(${CURL_INCLUDE_DIRS}) 
# target_link_libraries(${APP_NAME} ${CURL_LIBRARIES})



# 2.curl引入方法二，导入目标导入（推荐）
# find_package(PkgConfig REQUIRED)
# pkg_check_modules(CURL REQUIRED IMPORTED_TARGET libcurl)
# add_executable(${APP_NAME} ${SOURCE_FILES})
# target_link_libraries(${APP_NAME} PkgConfig::CURL)




# ------------传统方式使用静态库和动态库----------------------
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