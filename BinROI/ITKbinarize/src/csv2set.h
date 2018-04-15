#include <iostream> // these for csv2set.h
#include <sstream>
#include <string>
#include <vector>
#include <set>

// reads the specifically formatted (by XML2csv.py) filename and encodes it as a set

std::set< std::vector<float> > csv2set (std::string filename) {

	using namespace std;

	set< vector<float> > result;

	ifstream file(filename.c_str());
	
	string line; // line ex: 34, 56, -16.5000 \n
	
	int c1, c2;
	//int db1; int db2;
	string xstr; string ystr; string zstr; // intermediate vars for debugging
	
	vector<float> vec(3,0.0);


	while(getline(file, line)) {
		
		c1 = line.find_first_of(",");
		c2 = line.find_last_of(",");
		
		xstr = line.substr(0,c1);
		ystr = line.substr(c1+1, (c2-c1)); // why
		zstr = line.substr(c2+1, (line.size() - 1));

		vec[0] = atof(xstr.c_str());
		vec[1] = atof(ystr.c_str());
		vec[2] = atof(zstr.c_str());

		result.insert(vec);
 
	}

	return result;

}