# The project contains 2 folders:
# src: contains all *.cpp source code;
# include: contains all header files.

# Compiler & linker.
CC=g++
# Compile flags.
CFLAGS=-g -c
# Linked libraries.
LDFLAGS=../HElib/src/fhe.a ../ntl-10.3.0/src/ntl.a -lgmp -lpthread
# Non-stand include paths.
INCLUDE_PATH=-I.. -I../ntl-10.3.0/include -I./include

# All header files
HEADERS=$(wildcard include/*.h)
# All source files
SOURCES=$(wildcard src/*.cpp)

# Subsitute every '.cpp' prefix in $(SOURCES) variable with the '.o'.
OBJECTS=$(SOURCES:.cpp=.o)

# The final executable file
EXEC=app

# Build final executable file
all: $(EXEC) $(OBJECTS)
	$(CC) $(OBJECTS) -o $(EXEC) $(LDFLAGS) 

# For insurance: if any header file is changed, re-compile the whole project.
%.o:%.cpp $(HEADERS)
	$(CC) $(INCLUDE_PATH) $(CFLAGS) $< -o $@

# Remove executable file and all object files
clean:
	rm -f $(OBJECTS) $(EXEC)