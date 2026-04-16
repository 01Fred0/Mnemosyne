cmake_minimum_required(VERSION 3.10)
project(Mnemosyne)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Use vcpkg toolchain
set(CMAKE_TOOLCHAIN_FILE "${CMAKE_CURRENT_SOURCE_DIR}/vcpkg/scripts/buildsystems/vcpkg.cmake")

# Find required packages
find_package(glfw3 CONFIG REQUIRED)
find_package(glm CONFIG REQUIRED)
find_package(assimp CONFIG REQUIRED)
find_package(nlohmann_json CONFIG REQUIRED)
find_package(GLEW REQUIRED)

# Add all source files
file(GLOB_RECURSE SOURCES "src/*.cpp")
file(GLOB_RECURSE HEADERS "include/*.h")

# Create executable
add_executable(Mnemosyne ${SOURCES} ${HEADERS})

# Link libraries
target_link_libraries(Mnemosyne PRIVATE glfw glm::glm assimp::assimp nlohmann_json::nlohmann_json GLEW::GLEW)

# Include directories
target_include_directories(Mnemosyne PRIVATE include)
target_include_directories(Mnemosyne PRIVATE vcpkg/installed/x64-windows/include)

# Add compile definitions
target_compile_definitions(Mnemosyne PRIVATE MNEMOSYNE_APP)
