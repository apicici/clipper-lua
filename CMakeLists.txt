CMAKE_MINIMUM_REQUIRED(VERSION 3.1.0)
PROJECT(clipper)

SET(LUA_VERSION "5.1" CACHE STRING "Lua version")

FIND_PACKAGE(Lua ${LUA_VERSION} EXACT REQUIRED)

INCLUDE_DIRECTORIES(${LUA_INCLUDE_DIR})

ADD_LIBRARY(clipper SHARED src/clipper/clipper.cpp src/clipper_wrap.cxx)

SET_TARGET_PROPERTIES(clipper PROPERTIES PREFIX "")
TARGET_LINK_LIBRARIES(clipper ${LUA_LIBRARIES})
