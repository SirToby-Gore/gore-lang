# Gore lang
This is a programming language with two preposes in mind:
firstly to have the syntactic features of rust and c++, the zen of python, the documentation of dart, the naming scheme from JS, and the simplicity of ruby;
secondly to brag about a language I built in my name.

# Here is the fibonacci in the hypothetical syntax
```gre
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

## To create a new package
a.k.a a feature you need to run your OS's script
1. cd into packages
2. run `./make_package.<sh or ps1> <package name>`
3. cd into your package
4. to build just your package run `./build_<package name>.<sh or ps1>` inside the package's directory
5. to build all the packages run `./build_packages.py` inside the packages directory
    - this will build all the packages

# The structure
* `bin` holds 1 file for the `gore_lang.dart` as the main entrypoint
* `docs` holds all the documentation on the language
* `lib` holds all the dart files for the language
* `modules` holds all the built modules for the language, `built_ins` holds all the ones made for the language, and `installed` has all the user install ones
* `packages` holds all the functionality of the language e.g. `print`, `exit`, all the types and so on
* `test` are a handful of test scripts written in gore lang