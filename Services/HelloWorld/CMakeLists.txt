cmake_minimum_required(VERSION 3.17)

# ----------------------------------------------------------------------------
# Ensure proper build
# ----------------------------------------------------------------------------
if(CMAKE_SOURCE_DIR STREQUAL CMAKE_BINARY_DIR)
    message("*** ERROR *** You are attempting an in-source build!")
    message("Please try removing the current build by deleting the cache.")
    message("Binary Directory : ${CMAKE_BINARY_DIR}")
    message("Current Directory: ${CMAKE_SOURCE_DIR}")
    message(FATAL_ERROR "Then try to build again")
endif()

if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "Release" CACHE STRING "Build Type: Release (default) or Debug")
    message(STATUS "Defaulting build type to ${CMAKE_BUILD_TYPE}")
endif()

set(PROJECT_VERSION_MAJOR 1)
set(PROJECT_VERSION_MINOR 0)
set(PROJECT_VERSION_PATCH 0)
set(PROJECT_VERSION ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}.${PROJECT_VERSION_PATCH})

set(PROJECT_NAME HelloWorld)
project(${PROJECT_NAME} VERSION ${PROJECT_VERSION} LANGUAGES CXX)

# Set up build directories
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/archive)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

# Enable unit tests
enable_testing()

# Enable CMake target folders view in IDEs
set_property(GLOBAL PROPERTY USE_FOLDERS ON)
set(PROJECT_FOLDER ${PROJECT_NAME})

# Tell CMake where our modules are
list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)

# ----------------------------------------------------------------------------
# Define the project variables
# ----------------------------------------------------------------------------
# Set up some custom flags for this project
set(PROJECT_CXX_FLAGS
    ${CMAKE_CXX_FLAGS}
)

set(PROJECT_INCLUDE_DIRS
    ${CMAKE_CURRENT_SOURCE_DIR}
)

set(PROJECT_LIBRARIES
)

# ----------------------------------------------------------------------------
# Initialize custom modules
# ----------------------------------------------------------------------------
# Initialize GoogleTest List module
include(gtest_unittestList)
gtest_unittestList_Init()

# ----------------------------------------------------------------------------
# Add Subdirectories
# ----------------------------------------------------------------------------
add_subdirectory(UnitTests)

# ----------------------------------------------------------------------------
# Add Executable
# ----------------------------------------------------------------------------
# Add source to this project's executable.
set(SOURCES
    main.cpp
)

set(HEADERS
)

add_executable(${PROJECT_NAME} ${SOURCES})
target_compile_options(${PROJECT_NAME}
                       PUBLIC ${PROJECT_CXX_FLAGS}
)
target_compile_definitions(${PROJECT_NAME}
                           PUBLIC ${PROJECT_DEFINITIONS}
)
target_include_directories(${PROJECT_NAME}
                           PUBLIC ${PROJECT_INCLUDE_DIRS}
)
target_link_libraries(${PROJECT_NAME}
)

# Now let's also install our targets
install(TARGETS ${PROJECT_NAME} DESTINATION ${CMAKE_BINARY_DIR})
