# make_package.ps1
# This script should be run on Windows (PowerShell) to create a new package directory
# and generate build scripts and C++ source/headers for both Windows (DLL) and Linux (SO).

param(
    [string]$packageName # The name of the package to create (e.g., "myprinter")
)

# Set error action preference to stop on any error.
$ErrorActionPreference = "Stop"

# --- Input Validation ---
if (-not $packageName) {
    Write-Host "Usage: ." + (Split-Path -Path $PSScriptRoot -Leaf) + "make_package.ps1 <package_name>"
    exit 1
}

Write-Host "Making package: $packageName"

# Convert package name to uppercase for macro definitions (e.g., MYPRINTER_API, MYPRINTER_EXPORTS)
$packageUpper = $packageName.ToUpper()

# --- Create directory for the package ---
# -Force parameter creates parent directories if they don't exist and suppresses errors if dir exists.
New-Item -ItemType Directory -Path $packageName -Force
Set-Location -Path $packageName # Change into the new package directory

# --- Create the Linux build script (build_<package_name>.sh) ---
# Using a PowerShell "Here-String" (@" ... "@) for multi-line content
$shContent = @"
#!/bin/bash

# Build script for Linux (.so)
# This script uses g++ to compile and link a shared object.

echo "Compiling $packageName.cpp for Linux..."
# Compile with Position-Independent Code (PIC)
g++ -c -fPIC $packageName.cpp -o $packageName.o

if [ \$? -ne 0 ]; then
    echo "Error: Compilation failed for $packageName.cpp"
    exit 1
fi

echo "Linking lib_$packageName.so..."
# Link to create the shared object (.so)
g++ -shared $packageName.o -o lib_$packageName.so

if [ \$? -ne 0 ]; then
    echo "Error: Linking failed for lib_$packageName.so"
    exit 1
fi

echo "Successfully built lib_$packageName.so"
"@
$shContent | Set-Content -Path "build_$packageName.sh"

# Note for Linux .sh scripts generated on Windows:
# PowerShell on Windows does not set Unix-like executable permissions (chmod +x).
# If you transfer this 'build_<package_name>.sh' script to a Linux/WSL environment
# and want to execute it directly, you will need to manually run 'chmod +x build_<package_name>.sh' there.

# --- Create the Windows build script (build_<package_name>.ps1) ---
$ps1Content = @"
# PowerShell script to build a Windows DLL (.dll)
# This script assumes you are running it from a Visual Studio Developer Command Prompt
# or that 'cl.exe' and 'link.exe' (MSVC compiler tools) are in your system's PATH.

\$packageName = "$packageName"
\$outputDll = "lib_\$packageName.dll"
\$sourceFile = "\$packageName.cpp"

Write-Host "Compiling \$sourceFile for Windows..."

# Compile and link the DLL using MSVC (cl.exe)
# /LD: Creates a DLL
# /EHsc: Enables C++ exception handling (recommended)
# /Fe:\$outputDll: Specifies the output DLL file name
# /D ${packageUpper}_EXPORTS: Defines the macro to activate dllexport in the header
cl.exe /LD /EHsc /Fe:\$outputDll /D ${packageUpper}_EXPORTS \$sourceFile

if (\$LASTEXITCODE -ne 0) {
    Write-Error "DLL compilation failed for \$packageName."
    exit 1
}

Write-Host "Successfully built \$outputDll"
"@
$ps1Content | Set-Content -Path "build_$packageName.ps1"

# --- Create the C++ source file (<package_name>.cpp) ---
$cppContent = @"
#include "$packageName.h"
#include <iostream> // Included for basic demonstration, can be removed if not needed

// Implement the function defined in the header
${packageUpper}_API void ${packageName}_func(/* args */) {
    // Example: Print a message to demonstrate functionality
    std::cout << "Hello from ${packageName} package!" << std::endl;
    // Add your specific function logic here
}
"@
$cppContent | Set-Content -Path "$packageName.cpp"

# --- Create the C++ header file (<package_name>.h) ---
$hContent = @"
#ifndef ${packageUpper}_H
#define ${packageUpper}_H

// Macro for Windows DLL export/import
// _WIN32 is a predefined macro by MSVC when compiling for Windows.
#ifdef _WIN32
  #ifdef ${packageUpper}_EXPORTS
    #define ${packageUpper}_API __declspec(dllexport) // Export for building the DLL
  #else
    #define ${packageUpper}_API __declspec(dllimport) // Import for using the DLL
  #endif
#else // Linux/Unix-like (GCC/Clang)
  // For GCC/Clang, functions are often exported by default.
  // If using -fvisibility=hidden, you might need __attribute__((visibility("default"))).
  // For simple cases, no explicit attribute is needed here.
  #define ${packageUpper}_API
#endif

#ifdef __cplusplus
extern "C" { // Ensure C linkage to prevent C++ name mangling
#endif

// Declare the function that will be exported/imported
${packageUpper}_API void ${packageName}_func(/* args */);

#ifdef __cplusplus
}
#endif

#endif // ${packageUpper}_H
"@
$hContent | Set-Content -Path "$packageName.h"

# --- Return to the original directory ---
Set-Location -Path ..

Write-Host "Package '$packageName' structure created successfully with Linux (.sh) and Windows (.ps1) build scripts."