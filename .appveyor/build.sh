[[ `uname` = Linux ]] && PIP=pip || PIP=pip3

$PIP install hererocks
hererocks lua -l 5.1 --cflags="-fPIC"
export CMAKE_PREFIX_PATH=$PWD/lua

mkdir -p build && cd build
cmake ..
cmake --build .
zip -j ../build.zip *.so *.dylib
zip -j ../build.zip ../*.md
zip -j ../build.zip ../.appveyor/*.md
