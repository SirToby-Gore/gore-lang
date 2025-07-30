#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Check if a package name was provided
if [ -z "$1" ]; then
  echo "Usage: $0 <package_name>"
  exit 1
fi

echo "Making package: $1"

PACKAGE_UPPER=$(echo "$1" | tr '[:lower:]' '[:upper:]')

# Create directory for the package
mkdir -p "$1" 
cd "$1"

cat .template/build.sh "build_$1.sh"
chmod +x "build_$1.sh"

cat .template/build.ps1 > "build_$1.ps1"

echo "
#include \"$1.h\"

// Implement the function defined in the header
${PACKAGE_UPPER}_API void ${1}_func(/* args */) {
  // code goes here
}
" > "$1.cpp"

# --- Create the C++ header file (<package_name>.h) ---
echo "
#ifndef ${PACKAGE_UPPER}_H
#define ${PACKAGE_UPPER}_H

// Macro for Windows DLL export/import
// _WIN32 is a predefined macro by MSVC when compiling for Windows.
#ifdef _WIN32
  #ifdef ${PACKAGE_UPPER}_EXPORTS
    #define ${PACKAGE_UPPER}_API __declspec(dllexport) // Export for building the DLL
  #else
    #define ${PACKAGE_UPPER}_API __declspec(dllimport) // Import for using the DLL
  #endif
#else // Linux/Unix-like (GCC/Clang)
  // For GCC/Clang, functions are often exported by default.
  // If using -fvisibility=hidden, you might need __attribute__((visibility(\"default\"))).
  // For simple cases, no explicit attribute is needed here.
  #define ${PACKAGE_UPPER}_API
#endif

#ifdef __cplusplus
extern \"C\" { // Ensure C linkage to prevent C++ name mangling
#endif

// Declare the function that will be exported/imported
${PACKAGE_UPPER}_API void ${1}_func(/* args */);

#ifdef __cplusplus
}
#endif

#endif // ${PACKAGE_UPPER}_H
" > "$1.h"

# Return up one directory to the original location
cd ..

echo "Package '$1' structure created successfully with Linux (.sh) and Windows (.ps1) build scripts."