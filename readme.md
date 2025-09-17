# Gore lang
This is a programming language with two preposes in mind:
firstly to have the syntactic features of rust and c++, the zen of python, the documentation of dart, the naming scheme from JS, and the simplicity of ruby;
secondly to brag about a language I built in my name.

# Here is the fibonacci in the hypothetical syntax
```gore
// Sourced from Geeks for Geeks

def int fibonacci(int n):
  // If n is 1 or 0, then return n, 
  // works for 0th and 1st terms
  if n <= 1:
    return n

  // Recurrence relation to find 
  // the rest of the terms
  return fibonacci(n - 1) + fibonacci(n - 2)

def int main():
  const int number = 5

  // Finds the number to the nth term 
  // Makes an immutable pointer to the const number
  print(fibonacci(#number))

  return 0

exit(main())
```

if you want to look more at the syntax, look under `docs/docs.md`

# To install
1. download or clone all the files into a folder of your choice
2. have all the files unpacked and ready to use
3. open your terminal in the current `gore_lang` folder e.g. `~/downloads/gore_lang/`
4. run your corresponding script to install the language `.sh` for linux and `.ps1` for windows
5. all done, you may delete the remaining `gore_lang` folder from your chosen folder from the beginning

# To help
please feel free to help and collaborate on this language or suggest and changes with any part of it.

