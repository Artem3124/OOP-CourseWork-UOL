CXX = g++
CXXFLAGS = -std=c++11 -Wall -Wextra -O2

BUILD_DIR = build
SRC_DIR = .
UI_DIR = ui
CORE_DIR = core
UTILS_DIR = utils


$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

SRCS = $(wildcard $(CORE_DIR)/*.cpp) \
       $(wildcard $(UTILS_DIR)/*.cpp) \
       $(wildcard $(UI_DIR)/*.cpp) \
			 main.cpp

OBJS = $(patsubst %.cpp, $(BUILD_DIR)/%.o, $(SRCS))

TARGET = build/weatherAnalyzer

build: $(TARGET)

$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^

$(BUILD_DIR)/%.o: %.cpp | $(BUILD_DIR)
	mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -rf $(BUILD_DIR)

.PHONY: all clean
