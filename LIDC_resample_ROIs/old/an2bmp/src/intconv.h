#include "math.h"

int intconv (int val, int min, int max) {
	
	// val is the integer intensity value that is to be converted into a char
	// max and min are the predefined HU intensity values that we have determined to be the cutoff

	//char result;
	float valf = (float) val;

	if (val <= min) {
		return (int)(0);
	} else if (val	>= max)  {
		return (int)(255);
	} else {
		return (int) 255*( (valf + (float)max )/ ((float)(max - min)) ) ;
	}
}