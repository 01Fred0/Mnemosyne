@echo off
echo Building and Running Mnemosyne application...
echo.

REM Create build directory if it doesn't exist
if not exist "build" mkdir build
cd build

echo Configuring project...
cmake .. -DCMAKE_TOOLCHAIN_FILE=../vcpkg/scripts/buildsystems/vcpkg.cmake

if %errorlevel% neq 0 (
    echo CMake configuration failed!
    cd ..
    pause
    exit /b 1
)

echo.
echo Building project...
cmake --build . --config Release

if %errorlevel% neq 0 (
    echo Build failed!
    cd ..
    pause
    exit /b 1
)

echo.
echo Build completed successfully!
echo.
echo Starting application...
cd ..
build\Release\Mnemosyne.exe

if %errorlevel% neq 0 (
    echo Failed to start application!
    pause
    exit /b 1
)

cd ..
echo.
echo Application finished.
pause
