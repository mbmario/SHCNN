# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
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
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/mario/Documents/LIDC_Code_Current/BinROI/ITKbinarize/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/mario/Documents/LIDC_Code_Current/BinROI/ITKbinarize/build2

# Include any dependencies generated for this target.
include CMakeFiles/binarize.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/binarize.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/binarize.dir/flags.make

CMakeFiles/binarize.dir/main.cxx.o: CMakeFiles/binarize.dir/flags.make
CMakeFiles/binarize.dir/main.cxx.o: /home/mario/Documents/LIDC_Code_Current/BinROI/ITKbinarize/src/main.cxx
	$(CMAKE_COMMAND) -E cmake_progress_report /home/mario/Documents/LIDC_Code_Current/BinROI/ITKbinarize/build2/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/binarize.dir/main.cxx.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/binarize.dir/main.cxx.o -c /home/mario/Documents/LIDC_Code_Current/BinROI/ITKbinarize/src/main.cxx

CMakeFiles/binarize.dir/main.cxx.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/binarize.dir/main.cxx.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/mario/Documents/LIDC_Code_Current/BinROI/ITKbinarize/src/main.cxx > CMakeFiles/binarize.dir/main.cxx.i

CMakeFiles/binarize.dir/main.cxx.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/binarize.dir/main.cxx.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/mario/Documents/LIDC_Code_Current/BinROI/ITKbinarize/src/main.cxx -o CMakeFiles/binarize.dir/main.cxx.s

CMakeFiles/binarize.dir/main.cxx.o.requires:
.PHONY : CMakeFiles/binarize.dir/main.cxx.o.requires

CMakeFiles/binarize.dir/main.cxx.o.provides: CMakeFiles/binarize.dir/main.cxx.o.requires
	$(MAKE) -f CMakeFiles/binarize.dir/build.make CMakeFiles/binarize.dir/main.cxx.o.provides.build
.PHONY : CMakeFiles/binarize.dir/main.cxx.o.provides

CMakeFiles/binarize.dir/main.cxx.o.provides.build: CMakeFiles/binarize.dir/main.cxx.o

# Object files for target binarize
binarize_OBJECTS = \
"CMakeFiles/binarize.dir/main.cxx.o"

# External object files for target binarize
binarize_EXTERNAL_OBJECTS =

binarize: CMakeFiles/binarize.dir/main.cxx.o
binarize: CMakeFiles/binarize.dir/build.make
binarize: /usr/local/lib/libitkdouble-conversion-4.9.a
binarize: /usr/local/lib/libitksys-4.9.a
binarize: /usr/local/lib/libitkvnl_algo-4.9.a
binarize: /usr/local/lib/libitkvnl-4.9.a
binarize: /usr/local/lib/libitkv3p_netlib-4.9.a
binarize: /usr/local/lib/libITKCommon-4.9.a
binarize: /usr/local/lib/libitkNetlibSlatec-4.9.a
binarize: /usr/local/lib/libITKStatistics-4.9.a
binarize: /usr/local/lib/libITKTransform-4.9.a
binarize: /usr/local/lib/libITKLabelMap-4.9.a
binarize: /usr/local/lib/libITKMesh-4.9.a
binarize: /usr/local/lib/libitkzlib-4.9.a
binarize: /usr/local/lib/libITKMetaIO-4.9.a
binarize: /usr/local/lib/libITKSpatialObjects-4.9.a
binarize: /usr/local/lib/libITKPath-4.9.a
binarize: /usr/local/lib/libITKQuadEdgeMesh-4.9.a
binarize: /usr/local/lib/libITKIOImageBase-4.9.a
binarize: /usr/local/lib/libITKOptimizers-4.9.a
binarize: /usr/local/lib/libITKPolynomials-4.9.a
binarize: /usr/local/lib/libITKBiasCorrection-4.9.a
binarize: /usr/local/lib/libITKBioCell-4.9.a
binarize: /usr/local/lib/libITKDICOMParser-4.9.a
binarize: /usr/local/lib/libITKEXPAT-4.9.a
binarize: /usr/local/lib/libITKIOXML-4.9.a
binarize: /usr/local/lib/libITKIOSpatialObjects-4.9.a
binarize: /usr/local/lib/libITKFEM-4.9.a
binarize: /usr/local/lib/libitkgdcmDICT-4.9.a
binarize: /usr/local/lib/libitkgdcmMSFF-4.9.a
binarize: /usr/local/lib/libITKznz-4.9.a
binarize: /usr/local/lib/libITKniftiio-4.9.a
binarize: /usr/local/lib/libITKgiftiio-4.9.a
binarize: /usr/local/lib/libitkhdf5_cpp-4.9.a
binarize: /usr/local/lib/libitkhdf5-4.9.a
binarize: /usr/local/lib/libITKIOBMP-4.9.a
binarize: /usr/local/lib/libITKIOBioRad-4.9.a
binarize: /usr/local/lib/libITKIOCSV-4.9.a
binarize: /usr/local/lib/libITKIOGDCM-4.9.a
binarize: /usr/local/lib/libITKIOIPL-4.9.a
binarize: /usr/local/lib/libITKIOGE-4.9.a
binarize: /usr/local/lib/libITKIOGIPL-4.9.a
binarize: /usr/local/lib/libITKIOHDF5-4.9.a
binarize: /usr/local/lib/libitkjpeg-4.9.a
binarize: /usr/local/lib/libITKIOJPEG-4.9.a
binarize: /usr/local/lib/libitktiff-4.9.a
binarize: /usr/local/lib/libITKIOTIFF-4.9.a
binarize: /usr/local/lib/libITKIOLSM-4.9.a
binarize: /usr/local/lib/libITKIOMRC-4.9.a
binarize: /usr/local/lib/libITKIOMesh-4.9.a
binarize: /usr/local/lib/libITKIOMeta-4.9.a
binarize: /usr/local/lib/libITKIONIFTI-4.9.a
binarize: /usr/local/lib/libITKNrrdIO-4.9.a
binarize: /usr/local/lib/libITKIONRRD-4.9.a
binarize: /usr/local/lib/libitkpng-4.9.a
binarize: /usr/local/lib/libITKIOPNG-4.9.a
binarize: /usr/local/lib/libITKIOSiemens-4.9.a
binarize: /usr/local/lib/libITKIOStimulate-4.9.a
binarize: /usr/local/lib/libITKIOTransformBase-4.9.a
binarize: /usr/local/lib/libITKIOTransformHDF5-4.9.a
binarize: /usr/local/lib/libITKIOTransformInsightLegacy-4.9.a
binarize: /usr/local/lib/libITKIOTransformMatlab-4.9.a
binarize: /usr/local/lib/libITKIOVTK-4.9.a
binarize: /usr/local/lib/libITKKLMRegionGrowing-4.9.a
binarize: /usr/local/lib/libITKOptimizersv4-4.9.a
binarize: /usr/local/lib/libitkopenjpeg-4.9.a
binarize: /usr/local/lib/libITKVTK-4.9.a
binarize: /usr/local/lib/libITKWatersheds-4.9.a
binarize: /usr/local/lib/libITKReview-4.9.a
binarize: /usr/local/lib/libITKVideoCore-4.9.a
binarize: /usr/local/lib/libITKVideoIO-4.9.a
binarize: /usr/local/lib/libITKgiftiio-4.9.a
binarize: /usr/local/lib/libITKLabelMap-4.9.a
binarize: /usr/local/lib/libITKQuadEdgeMesh-4.9.a
binarize: /usr/local/lib/libITKPolynomials-4.9.a
binarize: /usr/local/lib/libITKBiasCorrection-4.9.a
binarize: /usr/local/lib/libITKBioCell-4.9.a
binarize: /usr/local/lib/libITKIOSpatialObjects-4.9.a
binarize: /usr/local/lib/libITKIOXML-4.9.a
binarize: /usr/local/lib/libITKFEM-4.9.a
binarize: /usr/local/lib/libITKOptimizers-4.9.a
binarize: /usr/local/lib/libITKIOBMP-4.9.a
binarize: /usr/local/lib/libITKIOBioRad-4.9.a
binarize: /usr/local/lib/libITKIOGDCM-4.9.a
binarize: /usr/local/lib/libitkgdcmMSFF-4.9.a
binarize: /usr/local/lib/libitkgdcmDICT-4.9.a
binarize: /usr/local/lib/libitkgdcmIOD-4.9.a
binarize: /usr/local/lib/libITKEXPAT-4.9.a
binarize: /usr/local/lib/libitkgdcmDSED-4.9.a
binarize: /usr/local/lib/libitkgdcmCommon-4.9.a
binarize: /usr/local/lib/libitkgdcmjpeg8-4.9.a
binarize: /usr/local/lib/libitkgdcmjpeg12-4.9.a
binarize: /usr/local/lib/libitkgdcmjpeg16-4.9.a
binarize: /usr/local/lib/libitkgdcmopenjpeg-4.9.a
binarize: /usr/local/lib/libitkgdcmcharls-4.9.a
binarize: /usr/local/lib/libitkgdcmuuid-4.9.a
binarize: /usr/local/lib/libITKIOGE-4.9.a
binarize: /usr/local/lib/libITKIOGIPL-4.9.a
binarize: /usr/local/lib/libITKIOJPEG-4.9.a
binarize: /usr/local/lib/libITKIOTIFF-4.9.a
binarize: /usr/local/lib/libitktiff-4.9.a
binarize: /usr/local/lib/libitkjpeg-4.9.a
binarize: /usr/local/lib/libITKIOMeta-4.9.a
binarize: /usr/local/lib/libITKMetaIO-4.9.a
binarize: /usr/local/lib/libITKIONIFTI-4.9.a
binarize: /usr/local/lib/libITKniftiio-4.9.a
binarize: /usr/local/lib/libITKznz-4.9.a
binarize: /usr/local/lib/libITKIONRRD-4.9.a
binarize: /usr/local/lib/libITKNrrdIO-4.9.a
binarize: /usr/local/lib/libITKIOPNG-4.9.a
binarize: /usr/local/lib/libitkpng-4.9.a
binarize: /usr/local/lib/libITKIOSiemens-4.9.a
binarize: /usr/local/lib/libITKIOIPL-4.9.a
binarize: /usr/local/lib/libITKIOStimulate-4.9.a
binarize: /usr/local/lib/libITKIOTransformHDF5-4.9.a
binarize: /usr/local/lib/libitkhdf5_cpp-4.9.a
binarize: /usr/local/lib/libitkhdf5-4.9.a
binarize: /usr/local/lib/libitkzlib-4.9.a
binarize: /usr/local/lib/libITKIOTransformInsightLegacy-4.9.a
binarize: /usr/local/lib/libITKIOTransformMatlab-4.9.a
binarize: /usr/local/lib/libITKIOTransformBase-4.9.a
binarize: /usr/local/lib/libITKIOVTK-4.9.a
binarize: /usr/local/lib/libITKKLMRegionGrowing-4.9.a
binarize: /usr/local/lib/libitkopenjpeg-4.9.a
binarize: /usr/local/lib/libITKVTK-4.9.a
binarize: /usr/local/lib/libITKWatersheds-4.9.a
binarize: /usr/local/lib/libITKStatistics-4.9.a
binarize: /usr/local/lib/libitkNetlibSlatec-4.9.a
binarize: /usr/local/lib/libITKSpatialObjects-4.9.a
binarize: /usr/local/lib/libITKMesh-4.9.a
binarize: /usr/local/lib/libITKTransform-4.9.a
binarize: /usr/local/lib/libITKPath-4.9.a
binarize: /usr/local/lib/libITKIOImageBase-4.9.a
binarize: /usr/local/lib/libITKVideoCore-4.9.a
binarize: /usr/local/lib/libITKCommon-4.9.a
binarize: /usr/local/lib/libitkdouble-conversion-4.9.a
binarize: /usr/local/lib/libitksys-4.9.a
binarize: /usr/local/lib/libITKVNLInstantiation-4.9.a
binarize: /usr/local/lib/libitkvnl_algo-4.9.a
binarize: /usr/local/lib/libitkv3p_lsqr-4.9.a
binarize: /usr/local/lib/libitkvnl-4.9.a
binarize: /usr/local/lib/libitkvcl-4.9.a
binarize: /usr/local/lib/libitkv3p_netlib-4.9.a
binarize: CMakeFiles/binarize.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable binarize"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/binarize.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/binarize.dir/build: binarize
.PHONY : CMakeFiles/binarize.dir/build

CMakeFiles/binarize.dir/requires: CMakeFiles/binarize.dir/main.cxx.o.requires
.PHONY : CMakeFiles/binarize.dir/requires

CMakeFiles/binarize.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/binarize.dir/cmake_clean.cmake
.PHONY : CMakeFiles/binarize.dir/clean

CMakeFiles/binarize.dir/depend:
	cd /home/mario/Documents/LIDC_Code_Current/BinROI/ITKbinarize/build2 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mario/Documents/LIDC_Code_Current/BinROI/ITKbinarize/src /home/mario/Documents/LIDC_Code_Current/BinROI/ITKbinarize/src /home/mario/Documents/LIDC_Code_Current/BinROI/ITKbinarize/build2 /home/mario/Documents/LIDC_Code_Current/BinROI/ITKbinarize/build2 /home/mario/Documents/LIDC_Code_Current/BinROI/ITKbinarize/build2/CMakeFiles/binarize.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/binarize.dir/depend

