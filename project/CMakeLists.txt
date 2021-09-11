# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------
# ----- IPCC LIBRARY BUILD SYSTEM --------------------------------------------
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------

# These variables are cached across multiple calls to cmake. Use cmake -LH for
# current cache values

# To override, use:
#   cmake -D[VAR]=[VALUE] [Path to root CMakeLists.txt]
# eg
#   cmake -DDISTRIBUTED=1 ..


# ----- COMPILER ----------------------------------------------------------------
# cmake required version
cmake_minimum_required(VERSION 3.0.0)

# compiler followed close behind by version
# set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_C_COMPILER "icc")
set(CMAKE_CXX_COMPILER "icpc")

# more error message
SET( CMAKE_VERBOSE_MAKEFILE on  )

#project name
PROJECT(ipcc_test1)

option(MULTITHREADED "Switches on OpenMP Threading if an OpenMP implementation can be found. Set to 0 to disable." 1)
option(DISTRIBUTED "Whether the program will be run in distributed mode using MPI. Set to 1 to enable" 0)
option(COMPILEALL "Whether to COMPILE ALL" 1)
set(COMPILESINGLE "SLIC.cpp" CACHE STRING "Whether to COMPILE ALL")
set(CMAKE_BUILD_TYPE "Release" CACHE STRING "Which build type")

# Show the user their settings
message("-- USER SETTINGS: ")
message(STATUS "  OMP acceleration is ${MULTITHREADED}")
message(STATUS "  MPI distribution is ${DISTRIBUTED}")
message(STATUS "  COMPILEALL is ${COMPILEALL}")
message(STATUS "  COMPILESINGLE is ${COMPILESINGLE}")
message(STATUS "  CMAKE_BUILD_TYPE is ${CMAKE_BUILD_TYPE}")

# ----- OPENMP ----------------------------------------------------------------

if (${MULTITHREADED})
  find_package(OpenMP)

  # If found, we must also check the version
  if (OPENMP_FOUND)
    # Version number is not cached, and we need to test for old versions
    set(OpenMP_C_VERSION ${OpenMP_C_VERSION} CACHE STRING "OpenMP C version")

    # MSVC, for instance, only implements OpenMP 2.0 (as of 2019)
    if (OpenMP_C_VERSION VERSION_LESS "3.1")  # todo find the real minimum required
      set(MULTITHREADED 0)
      message(WARNING "Found OpenMP ${OpenMP_C_VERSION} but this is too \
             old. Turning OpenMP support OFF.")
    else ()
      set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${OpenMP_C_FLAGS}")
      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${OpenMP_CXX_FLAGS}")
    endif ()
  endif ()

endif ()

# ------MPI -------------------------------------------------------------------
if (DISTRIBUTED)
  find_package(MPI REQUIRED)
  # Backwards compatibility
  if (DEFINED MPIEXEC)
    set (MPIEXEC_EXECUTABLE ${MPIEXEC} CACHE STRING "MPI Executable")
  endif()
  include_directories(${MPI_INCLUDE_PATH})
endif()

# ----- FLAGS ----------------------------------------------------------------
# set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O3 ")
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3 ")
# add_compile_options(-std=c++11)

# ----- C COMPILER FLAGS --------------------------------------------------

# set C flags that are common between compilers and build types
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} \
    -std=c++11"
)

# Use -O2 for all but debug mode by default
if (NOT("${CMAKE_BUILD_TYPE}" STREQUAL "Debug"))
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} \
        -O3"
    )
endif()

# Set c flags for release
set(CMAKE_C_FLAGS_RELEASE
    "-O3"
)

# Set c flags to use in debug mode
set(CMAKE_C_FLAGS_DEBUG
    "-g"
)

# TODO standardize
# set C compiler flags based on compiler type
if ("${CMAKE_C_COMPILER_ID}" STREQUAL "Clang")
  # using Clang
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} \
    -mavx -Wall"
  )
elseif ("${CMAKE_C_COMPILER_ID}" STREQUAL "GNU")
  # using GCC
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} \
    -mavx -Wall"
  )
elseif ("${CMAKE_C_COMPILER_ID}" STREQUAL "Intel")
  # using Intel
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} \
    -fprotect-parens -Wall -xAVX -axCORE-AVX2 -diag-disable cpu-dispatch"
  )
elseif ("${CMAKE_C_COMPILER_ID}" STREQUAL "MSVC")
  # using Visual Studio
endif()

# ----- C++ COMPILER FLAGS --------------------------------------------------

# set C++ flags that are common between compilers and build types
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} \
    -std=c++11 -Wall"
)

# Use -O2 for all but debug mode by default
if (NOT("${CMAKE_BUILD_TYPE}" STREQUAL "Debug"))
    set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS} \
        -O2"
    )
endif()

# Set c++ flags for release
set(CMAKE_CXX_FLAGS_RELEASE
    "-O2"
)

# Set c++ flags to use in debug mode
set(CMAKE_CXX_FLAGS_DEBUG
    "-g"
)

# set C++ compiler flags based on compiler type
if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
  # using Clang
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} \
    -mavx"
  )
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
  # using GCC
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} \
    -mavx"
  )
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Intel")
  # using Intel
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} \
    -xAVX -axCORE-AVX2 -diag-disable -cpu-dispatch"
  )
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
  # using Visual Studio
endif()

if (1)
    message("-- Compiler flags:")
    message("   C Compiler ID: ${CMAKE_C_COMPILER_ID}")
    message("   C++ Compiler ID: ${CMAKE_CXX_COMPILER_ID}")
    message("   C compilation flags: ${CMAKE_C_FLAGS}")
    # message("   CUDA compilation flags: ${CUDA_NVCC_FLAGS}")
    message("   C++ compilation flags: ${CMAKE_CXX_FLAGS}")

    message("-- Build type: ${CMAKE_BUILD_TYPE}")
    if ("${CMAKE_BUILD_TYPE}" STREQUAL "Debug")
        message("   C debug flags: ${CMAKE_C_FLAGS_DEBUG}")
        message("   C++ debug flags: ${CMAKE_CXX_FLAGS_DEBUG}")
    endif()
    if ("${CMAKE_BUILD_TYPE}" STREQUAL "Release")
        message("   C release flags: ${CMAKE_CXX_FLAGS_RELEASE}")
        message("   C++ release flags: ${CMAKE_CXX_FLAGS_RELEASE}")
    endif()
endif()

# ----- PATH ----------------------------------------------------------------

# tree
# ├── CMakeLists.txt
# ├── include
# │   └── SLIC.h
# ├── recmake.sh
# └── src
#     ├── out.log
#     ├── README.md
#     ├── SLIC.cpp
#     ├── SLIC_raw.cpp
#     └── slurm.sh

#head file path
INCLUDE_DIRECTORIES(include)

#source directory
AUX_SOURCE_DIRECTORY(src DIR_SRCS) # 指定源文件目录为src并将其赋值给环境变量DIR_SRCS

set(SRC_DIR ${CMAKE_CURRENT_SOURCE_DIR}/src)

#output path
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin)

# message
message("-- PATH: ")
message(STATUS "   PROJECT_SOURCE_DIR is ${PROJECT_SOURCE_DIR}")
message(STATUS "   PROJECT_BINARY_DIR is ${PROJECT_BINARY_DIR}")
message(STATUS "   CMAKE_CURRENT_SOURCE_DIR is ${CMAKE_CURRENT_SOURCE_DIR}")
message(STATUS "   DIR_SRCS is ${DIR_SRCS}")
message(STATUS "   SRC_DIR is ${SRC_DIR}")

# ----- EXECUTABLE ----------------------------------------------------------------


if (COMPILEALL)
    message("-- EXECUTABLE: COMPILEALL")
    file( GLOB APP_SOURCES "${SRC_DIR}/*.cpp"  )
    foreach( rawsourcefile IN LISTS APP_SOURCES  )
        message(STATUS "   rawsourcefile is ${rawsourcefile}")
        string( REGEX REPLACE "${SRC_DIR}/" "" sourcefile ${rawsourcefile}) #将文件名前的绝对路径去掉
        message(STATUS "   sourcefile is ${sourcefile}")
        string( REPLACE ".cpp" "" program ${sourcefile}  )
        add_executable( ${program} ${rawsourcefile}  )
    endforeach( rawsourcefile )
else()
    message("-- EXECUTABLE: COMPILESINGLE")
    string( REPLACE ".cpp" "" program ${COMPILESINGLE}  )
    ADD_EXECUTABLE(${program} ${SRC_DIR}/${COMPILESINGLE})
endif()


#----- how to use ----------------------------------------------------------------
# cd build
# cmake -DCOMPILEALL=0 -DCOMPILESINGLE=SLIC.cpp ..
