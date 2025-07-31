#ifndef PRINT_H
#define PRINT_H

#ifdef _WIN32
  #ifdef PRINT_EXPORTS
    #define PRINT_API __declspec(dllexport)
  #else
    #define PRINT_API __declspec(dllimport)
  #endif
#else
  #define PRINT_API
#endif

#ifdef __cplusplus
extern "C" {
#endif
// Declare the function that will be exported/imported
PRINT_API void print_func(const char* message, int use_stderr, int add_leading_newline);

#ifdef __cplusplus
}
#endif

#endif // PRINT_H