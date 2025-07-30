g++ -c -fPIC print.cpp -o print.o
g++ -shared print.o -o lib_print.so