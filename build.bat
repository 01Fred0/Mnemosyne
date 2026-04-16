@echo off
echo Building Mnemosyne application...
echo.

REM Find vcpkg's CMake
set CMAKE_PATH=vcpkg\downloads\tools\cmake-3.27.1-windows\cmake-3.27.1-windows-x86_64\bin\cmake.exe

if not exist "%CMAKE_PATH%" (
    echo CMake not found. Please install CMake or add vcpkg's CMake to PATH
    pause
    exit /b 1
)

echo Using CMake from vcpkg...
if not exist "build" mkdir build
cd build

"%CMAKE_PATH%" .. -DCMAKE_TOOLCHAIN_FILE=../vcpkg/scripts/buildsystems/vcpkg.cmake

if %errorlevel% neq 0 (
    echo CMake configuration failed!
    cd ..
    pause
    exit /b 1
)

"%CMAKE_PATH%" --build . --config Release

if %errorlevel% neq 0 (
    echo Build failed!
    cd ..
    pause
    exit /b 1
)

echo.
echo Build completed successfully!
echo.
echo To run the application, execute: build\Release\Mnemosyne.exe
cd ..
pause
