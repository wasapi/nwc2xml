TARGET = bin/nwc2xml
SOURCES = \
  src/nwc2xml.cpp\
  src/nwcfile.cpp\
  src/nwcobj.cpp\
  src/precompile.cpp\
  src/xmlsaver.cpp\
  src/xmlwriter.cpp
INCLUDES =
DEFINES =

CXX = g++
CC = gcc
CXXFLAGS = `wx-config --cppflags` 
CCFLAGS = `wx-config --flags`
LIBS = `wx-config --libs`

OBJECTS := $(SOURCES:.cpp=.o)
OBJECTS := $(OBJECTS:.c=.o)
DEPS = $(OBJECTS:.o=.d)
-include $(DEPS)
	
%.o: %.cpp
	@mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) $(INCLUDES) $(DEFINES) -c $< -o $@

%.o: %.c
	@mkdir -p $(@D)
	$(CC) $(CCFLAGS) $(INCLUDES) $(DEFINES) -c $< -o $@
	
all: $(TARGET)

$(TARGET): $(OBJECTS)
	@mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) $(OBJECTS) -o $@ $(LIBS)

clean:
	@rm -rf $(OBJECTS) $(DEPS) $(TARGET)

