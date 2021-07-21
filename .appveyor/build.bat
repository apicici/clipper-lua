reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32 || set OS=64
if %OS%==64 (set ARCH=x64) else (set ARCH=Win32)

call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvars%OS%.bat"
pip install hererocks
hererocks lua -l 5.1 --cflags="-fPIC"
set CMAKE_PREFIX_PATH=%cd%\lua
mkdir build
cd build
cmake -A %ARCH% ..
cmake --build . --config Release
robocopy ../ Release/ *.md
cd Release
7z a -tzip build.zip *.dll *.md
