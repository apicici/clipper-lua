%module clipper
%{
/* Includes the header in the wrapper code */
#include "clipper/clipper.hpp"
%}

/* Parse the header file to generate wrappers */
%ignore operator<<;
%include "std_vector.i"
%include "clipper/clipper.hpp"

namespace std {
   %template(Path) vector<ClipperLib::IntPoint>;
   %template(Paths) vector<ClipperLib::Path>;
   %template(PolyNodes) vector<ClipperLib::PolyNode*>;
};
