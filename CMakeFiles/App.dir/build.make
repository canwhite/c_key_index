# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.27

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/homebrew/Cellar/cmake/3.27.3/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/Cellar/cmake/3.27.3/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/zack/Desktop/c_key_index

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/zack/Desktop/c_key_index

# Include any dependencies generated for this target.
include CMakeFiles/App.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/App.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/App.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/App.dir/flags.make

CMakeFiles/App.dir/start.c.o: CMakeFiles/App.dir/flags.make
CMakeFiles/App.dir/start.c.o: start.c
CMakeFiles/App.dir/start.c.o: CMakeFiles/App.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/zack/Desktop/c_key_index/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/App.dir/start.c.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/App.dir/start.c.o -MF CMakeFiles/App.dir/start.c.o.d -o CMakeFiles/App.dir/start.c.o -c /Users/zack/Desktop/c_key_index/start.c

CMakeFiles/App.dir/start.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/App.dir/start.c.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/zack/Desktop/c_key_index/start.c > CMakeFiles/App.dir/start.c.i

CMakeFiles/App.dir/start.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/App.dir/start.c.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/zack/Desktop/c_key_index/start.c -o CMakeFiles/App.dir/start.c.s

# Object files for target App
App_OBJECTS = \
"CMakeFiles/App.dir/start.c.o"

# External object files for target App
App_EXTERNAL_OBJECTS =

App: CMakeFiles/App.dir/start.c.o
App: CMakeFiles/App.dir/build.make
App: utils/libutil_static.a
App: CMakeFiles/App.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/zack/Desktop/c_key_index/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable App"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/App.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/App.dir/build: App
.PHONY : CMakeFiles/App.dir/build

CMakeFiles/App.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/App.dir/cmake_clean.cmake
.PHONY : CMakeFiles/App.dir/clean

CMakeFiles/App.dir/depend:
	cd /Users/zack/Desktop/c_key_index && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/zack/Desktop/c_key_index /Users/zack/Desktop/c_key_index /Users/zack/Desktop/c_key_index /Users/zack/Desktop/c_key_index /Users/zack/Desktop/c_key_index/CMakeFiles/App.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/App.dir/depend

