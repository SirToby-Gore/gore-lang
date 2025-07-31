#ifndef TEST_H
#define TEST_H

// Macro for Windows DLL export/import
// _WIN32 is a predefined macro by MSVC when compiling for Windows.
#ifdef _WIN32
  #ifdef TEST_EXPORTS
    #define TEST_API __declspec(dllexport) // Export for building the DLL
  #else
    #define TEST_API __declspec(dllimport) // Import for using the DLL
  #endif
#else // Linux/Unix-like (GCC/Clang)
  // For GCC/Clang, functions are often exported by default.
  // If using -fvisibility=hidden, you might need __attribute__((visibility("default"))).
  // For simple cases, no explicit attribute is needed here.
  #define TEST_API
#endif

#ifdef __cplusplus
extern "C" { // Ensure C linkage to prevent C++ name mangling
#endif

// Declare the function that will be exported/imported
TEST_API void test_func(/* args */);

#ifdef __cplusplus
}
#endif

#endif // TEST_H