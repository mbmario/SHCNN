#include "string.h"

std::string newname (std::string outname, int dim) {
	
  int ext_idx = outname.find_last_of(".");
  std::string sansext = outname.substr(0, ext_idx);
  std::string ext = outname.substr(ext_idx, outname.length());
  std::string middle;

  if (dim == 0 ) {
  	middle = "_fixed_x";
  } else if (dim == 1 ) {
  	middle = "_fixed_y";
  } else { // dim == 2
  	middle = "_fixed_z";
  }

  std::string resultname = sansext + middle + ext;	

  return resultname;
}