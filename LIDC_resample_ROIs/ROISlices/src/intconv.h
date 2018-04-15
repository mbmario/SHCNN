#include "math.h"

int intconv (int val, int min, int max) {
	
	// val is the integer intensity value that is to be converted into a char
	// max and min are the predefined HU intensity values that we have determined to be the cutoff

	//char result;
	float valf = (float) val;
	float charmax = 255.0;
	float prop;

	if (val <= min) {
		return (int)(0);
	} else if (val	>= max)  {
		return (int)(255);
	} else {
		prop = (valf - (float)min) / ((float)(max - min));
		return (int)(prop * charmax + 0.5f);
	}
}