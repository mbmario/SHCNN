
#include <iostream> // these for csv2set.h
#include <fstream>
#include <string>
#include "math.h"

#include "csv2set.h"

// tester file: reads a csv as a set, and then iterates over it and writes to out

int main( int argc, char * argv[] ) {
// argv[1]: filename (only arg)
	using namespace std;

	set< vector<float> > segset = csv2set(argv[2]);

	set< vector<float> >::iterator it;
	for (it = segset.begin(); it != segset.end(); ++it) {
		cout << (*it) << endl;
	}
}