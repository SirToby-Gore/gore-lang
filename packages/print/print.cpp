
#include "print.h"
#include <cstdio> // For fprintf, stdout, stderr

void print_message(const char* message, int use_stderr, int add_leading_newline) {
    FILE* output_stream = use_stderr ? stderr : stdout;

    if (add_leading_newline) {
        fprintf(output_stream, "\n");
    }
    
    fprintf(output_stream, "%s", message);

    fflush(output_stream);
}



