// reads the csv and returns a vector of mins and maxes so that a corresponding region may be extracted

// [0] minx [1] miny [2] minz [3] maxx [4] maxy [5] maxz

#include <iostream> // these for csv2set.h
#include <sstream>
#include <string>
#include <vector>

std::vector<float> csv2minmax (std::string filename) {

	using namespace std;
	
	vector<float> minmax (6, 0);
	bool first = true;

	ifstream file(filename.c_str());
	
	string line; // line ex: 34, 56, -16.5000 \n
	
	int c1, c2;
	float x, y, z;
	string xstr; string ystr; string zstr; // intermediate vars for debugging
	
	while(getline(file, line)) {
		
		c1 = line.find_first_of(",");
		c2 = line.find_last_of(",");
		
		xstr = line.substr(0,c1);
		ystr = line.substr(c1+1, (c2-c1)); // why
		zstr = line.substr(c2+1, (line.size() - 1));

		x = atof(xstr.c_str());
		y = atof(ystr.c_str());
		z = atof(zstr.c_str());

		if (first == true ) { // base case; set min/maxes
			minmax[0] = x;
			minmax[3] = x;
			minmax[1] = y;
			minmax[4] = y;
			minmax[2] = z;
			minmax[5] = z;
			first = false;
			continue; 
		}

		if (x < minmax[0]) {
			minmax[0] = x;
		} 
		if (x > minmax[3]) {
			minmax[3] = x;
		}
		if (y < minmax[1]) {
			minmax[1] = y;
		}
		if (y > minmax[4]) {
			minmax[4] = y;
		} 
		if (z < minmax[2]) {
			minmax[2] = z;
		}
		if (z > minmax[5]) {
			minmax[5] = z;
		}

	}
	return minmax;

}