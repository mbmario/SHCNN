// RandomForest.cxx
// works with opencv v 2

#include <cv.h>
#include <ml.h>
#include <stdio.h>
#include <fstream>


//#include "print_data.h"
//#include "print_tree.h"
//#include "prediction_sample.h"
#include "confusion_matrix_opencv2.h"


	// USE THIS FOR DOCUMENTATION: IS CORRECT VERSION 
	// http://docs.opencv.org/3.0-beta/modules/ml/doc/random_trees.html

using namespace cv;
using namespace std;

int main ( int argc, char * argv[]) {

	/* ARGUMENTS(10): [0] Randomforest.cxx, [1] training csv, [2] testing csv, [3] response index, [4] variable types string, [5] print extra output (1 == print, ~1 == don't), optional:{[6] maxDepth, [7] minSampleCount, [8] maxCategories, [9] nactiveVars [10] maxNumTrees} */

	int maxDepth; int minSampleCount; int maxCategories; int nactiveVars; int maxNumTrees;
	//vector<std::string> allArgs(argv, argv + argc);

	//interpreting args
	if (argc <  6) {
		std::cerr << "Please supply training, testing, response index, types, 1:printstuff" << std::endl;
	} else if (argc == 6 ) {
		std::cout << "Using default tree parameters" << std::endl;
		maxDepth = 7; 
		minSampleCount = 10; //investigate; lower?
		maxCategories = 5;
		nactiveVars = 10; // set to zero 
		maxNumTrees = 200;
	} else {
		std::cout << "Using given tree parameters" << std::endl;
		maxDepth = atoi(argv[6]); 
		minSampleCount = atoi(argv[7]);
		maxCategories = atoi(argv[8]);
		nactiveVars = atoi(argv[9]);
		maxNumTrees = atoi(argv[10]);
	}
	int responseStartIdx = atoi(argv[3]);
  	char* varTypeSpec_cstr = argv[4]; 	//std::string varTypeSpec_string(argv[4]);

  	// more parameters so it will be easier to set. Params is finnicky
  	float regression_accuracy = 0.01; // not used?
  	bool use_surrogates = false;
  	bool calc_var_importance = true;
  	float forest_accuracy = 0.01; 
	float priors[] = {1,1,1,1,1,1}; // one for each class (6)

	//set parameters
	CvRTParams params = CvRTParams(maxDepth, minSampleCount, regression_accuracy, use_surrogates, maxCategories, priors, calc_var_importance, nactiveVars, maxNumTrees, forest_accuracy, CV_TERMCRIT_ITER | CV_TERMCRIT_EPS);

	// SET THE DATA CONTAINER OBJECTS
	CvMLData* training = new CvMLData; 
	CvMLData* testing = new CvMLData; 
	training->read_csv(argv[1]);
	testing->read_csv(argv[2]);

	training->set_var_types(varTypeSpec_cstr);
	testing->set_var_types(varTypeSpec_cstr); 
	
	training->set_response_idx(responseStartIdx);
	testing->set_response_idx(responseStartIdx);

	if (atoi(argv[5]) == 1) { // PRINTSTUFF
		
		bool PRINT_EVERYTHING = true;
		if (PRINT_EVERYTHING) {
			std::cout << "training; " << std::endl; 
			//print_data(training); // prints all input info, outputs to matrix.txt
			std::cout << "testing; " << std::endl; 
			//print_data(testing);
		} 

		// output for testing, which should be the same as training
		// are cvmats 
		const CvMat* types = testing->get_var_types();
		std::cout << "var types: \n" << types << std::endl;
		const CvMat* var_idx = testing->get_var_idx();
		std::cout << "indices of active vars: \n" << var_idx << std::endl;

	}

	// SET THE RF OBJECT
	// weights of each classification/class



	// create, then load
	CvRTrees* rtree = new CvRTrees;
	rtree->train(training, params);

	// confusion matrix 
	confusion_matrix(testing, rtree); // prints stuff to std::cout


	// GET INFORMATION ABOUT ERROR
	float test_error = rtree->calc_error(training, CV_TEST_ERROR);
	float train_error = rtree->calc_error(training, CV_TRAIN_ERROR);
	Mat varImp = rtree->getVarImportance();

	std::cout << "test error is: " << test_error << std::endl; 
	std::cout << "train error is: " << train_error << std::endl; 
	std::cout << "Variable Importance \n" << varImp << std::endl;
}