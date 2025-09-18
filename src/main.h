#ifndef MAIN_H
#define MAIN_H

#include "functions.h"
#include "values.h"
#include "globals.h"
#include <map>
#include <iostream>
#include <stdio.h>
#include <fstream>
#include <string>
#include <regex>

std::vector<std::string> readFile(char* path);

std::string getNameSpace(std::string& line);

#endif