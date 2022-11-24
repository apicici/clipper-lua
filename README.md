# clipper-lua
Lua bindings for the C++ version of [Angus Johnson's Clipper library](https://sourceforge.net/projects/polyclipping/), generated with [SWIG](http://www.swig.org/).

## Pre-built binaries
Pre-built binaries for Lua 5.1 can be found in the [releases page](https://github.com/apicici/clipper-lua/releases) for the following systems/architectures:
* Linux x64
* Windows x86, x64
* macos x64

For other versions of Lua or different systems see the compilation instructions.

## Compilation
The Lua wrapper ```clipper_wrap.cxx``` was generated with SWIG 4.0 using
```bash
swig -nomoduleglobal -c++ -lua clipper.i
```
Use CMake to compile the shared library. The Lua version to target can be chosen by passing the ```LUA_VERSION``` variable to CMake:
```bash
cmake -D LUA_VERSION:STRING=5.3
```
The Lua version defaults to 5.1 if not specified.

## Usage
### C++ library
Refer to the [Clipper libary's documentation](http://www.angusj.com/delphi/clipper/documentation/Docs/_Body.htm) for usage of the C++ library.

### Lua bindings
The following assumes that the library was required as
```lua
clipper = require "clipper"
```
* Lua numbers are automatically converted to Clipper's ```CInt``` type
* SWIG does not use explicit pointers or references. Just pass an object to a function, and it will be treated as a value, pointer, or reference as necessary
* Clipper ```Path``` and ```Paths``` are wrapped in Lua and behave as ```std::vector```. Usage examples:
  ```lua
  path = clipper.Path() -- initialise empty vector
  path:push_back(clipper.IntPoint(1,2)) -- add IntPoint to vector
  
  path = clipper.Path(3) -- initialise vector of size 3
  path[0] = clipper.IntPoint(2, 3) -- specify first IntPoint in vector
  ```
