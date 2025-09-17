build/gore: src/main.cpp
	g++ src/main.cpp src/object.cpp src/functions.cpp src/globals.cpp src/values.cpp -o build/gore