# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/peter/Desktop/shahitut2

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/peter/Desktop/shahitut2/out/build

# Include any dependencies generated for this target.
include CMakeFiles/LveEngine.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/LveEngine.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/LveEngine.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/LveEngine.dir/flags.make

CMakeFiles/LveEngine.dir/src/instance.c.o: CMakeFiles/LveEngine.dir/flags.make
CMakeFiles/LveEngine.dir/src/instance.c.o: ../../src/instance.c
CMakeFiles/LveEngine.dir/src/instance.c.o: CMakeFiles/LveEngine.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/peter/Desktop/shahitut2/out/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/LveEngine.dir/src/instance.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/LveEngine.dir/src/instance.c.o -MF CMakeFiles/LveEngine.dir/src/instance.c.o.d -o CMakeFiles/LveEngine.dir/src/instance.c.o -c /home/peter/Desktop/shahitut2/src/instance.c

CMakeFiles/LveEngine.dir/src/instance.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/LveEngine.dir/src/instance.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/peter/Desktop/shahitut2/src/instance.c > CMakeFiles/LveEngine.dir/src/instance.c.i

CMakeFiles/LveEngine.dir/src/instance.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/LveEngine.dir/src/instance.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/peter/Desktop/shahitut2/src/instance.c -o CMakeFiles/LveEngine.dir/src/instance.c.s

CMakeFiles/LveEngine.dir/src/main.c.o: CMakeFiles/LveEngine.dir/flags.make
CMakeFiles/LveEngine.dir/src/main.c.o: ../../src/main.c
CMakeFiles/LveEngine.dir/src/main.c.o: CMakeFiles/LveEngine.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/peter/Desktop/shahitut2/out/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/LveEngine.dir/src/main.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/LveEngine.dir/src/main.c.o -MF CMakeFiles/LveEngine.dir/src/main.c.o.d -o CMakeFiles/LveEngine.dir/src/main.c.o -c /home/peter/Desktop/shahitut2/src/main.c

CMakeFiles/LveEngine.dir/src/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/LveEngine.dir/src/main.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/peter/Desktop/shahitut2/src/main.c > CMakeFiles/LveEngine.dir/src/main.c.i

CMakeFiles/LveEngine.dir/src/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/LveEngine.dir/src/main.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/peter/Desktop/shahitut2/src/main.c -o CMakeFiles/LveEngine.dir/src/main.c.s

# Object files for target LveEngine
LveEngine_OBJECTS = \
"CMakeFiles/LveEngine.dir/src/instance.c.o" \
"CMakeFiles/LveEngine.dir/src/main.c.o"

# External object files for target LveEngine
LveEngine_EXTERNAL_OBJECTS =

LveEngine: CMakeFiles/LveEngine.dir/src/instance.c.o
LveEngine: CMakeFiles/LveEngine.dir/src/main.c.o
LveEngine: CMakeFiles/LveEngine.dir/build.make
LveEngine: /usr/lib/x86_64-linux-gnu/libglfw.so.3.3
LveEngine: /usr/lib/x86_64-linux-gnu/libvulkan.so
LveEngine: CMakeFiles/LveEngine.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/peter/Desktop/shahitut2/out/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable LveEngine"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/LveEngine.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/LveEngine.dir/build: LveEngine
.PHONY : CMakeFiles/LveEngine.dir/build

CMakeFiles/LveEngine.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/LveEngine.dir/cmake_clean.cmake
.PHONY : CMakeFiles/LveEngine.dir/clean

CMakeFiles/LveEngine.dir/depend:
	cd /home/peter/Desktop/shahitut2/out/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/peter/Desktop/shahitut2 /home/peter/Desktop/shahitut2 /home/peter/Desktop/shahitut2/out/build /home/peter/Desktop/shahitut2/out/build /home/peter/Desktop/shahitut2/out/build/CMakeFiles/LveEngine.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/LveEngine.dir/depend

