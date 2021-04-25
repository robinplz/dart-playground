cmake_minimum_required(VERSION 3.0.0)
project(app-core VERSION 0.1.0)

# specify the C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# architecture
set(CMAKE_OSX_ARCHITECTURES x86_64)

# library output dir
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)

# concat source files
set(SOURCES app-core.cpp 
            api/app-core-api.cpp)

add_library(app-core SHARED ${SOURCES})

install(TARGETS app-core 
        DESTINATION "${CMAKE_SOURCE_DIR}/bin"
        COMPONENT Runtime)