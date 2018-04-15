// RandomForest.cxx

#include <opencv2/core.hpp>
//#include <opencv2/cv.hpp>
#include <opencv2/ml.hpp>

#include <stdio.h>
#include <fstream>
//#include <math.h>

/*# include "print_data.h"
# include "print_tree.h"
# include "prediction_sample.h" */
#include "confusion_matrix.h"


/* USE THIS FOR DOCUMENTATION: IS CORRECT VERSION 
http://docs.opencv.org/3.0-beta/modules/ml/doc/random_trees.html
good example: https://github.com/Itseez/opencv/blob/master/samples/cpp/letter_recog.cpp */

using namespace std;
using namespace cv;
using namespace cv::ml;

	// have option for priors too (further arguments)

int main ( int argc, char * argv[]) {

	/* ARGUMENTS(10): [0] Randomforest.cxx, [1] training csv, [2] testing csv, [3] response index, [4] variable types string, [5] print extra output (1 == print, ~1 == don't), optional:{[6] maxDepth, [7] minSampleCount, [8] maxCategories, [9] nactiveVars} */

	int maxDepth; int minSampleCount; int maxCategories; int nactiveVars;
	//vector<std::string> allArgs(argv, argv + argc);

	//interpreting args
	if (argc <  6) {
		cerr << "Please supply training, testing, response index, types, 1:printstuff" << endl;
	} else if (argc == 6 ) {
		cout << "Using default tree parameters" << endl;
		maxDepth = 7; 
		minSampleCount = 10;
		maxCategories = 5;
		nactiveVars = 10;
	} else {
		cout << "Using given tree parameters" << endl;
		maxDepth = atoi(argv[6]); 
		minSampleCount = atoi(argv[7]);
		maxCategories = atoi(argv[8]);
		nactiveVars = atoi(argv[9]);
	}
	int responseStartIdx = atoi(argv[3]);
	std::string varTypeSpec_string(argv[4]);
	
	// SET TRAINING DATA (TrainData)
		//loadFromCSV(const String& filename, int headerLineCount, int responseStartIdx=-1, int responseEndIdx=-1, const String& varTypeSpec=String(), char delimiter=',', char missch='?')
	
	//GET a MAT somehow
	typedef int raw_datatype;


	Ptr<TrainData> training = TrainData::loadFromCSV(argv[1], 0, responseStartIdx, -1, varTypeSpec_string);





	 // SET TESTING DATA (TestData)
		// save as "InputArray ....floating-point matrix" for use in predict
	Ptr<TrainData> testing = TrainData::loadFromCSV(argv[2], 0, responseStartIdx, -1, varTypeSpec_string);
 	

	// CREATE THE RF WITH PARAMETERS
	//RTrees::Params * parameters = new RTrees::Params(maxDepth, minSampleCount, 0, false, maxCategories, Mat(), false, nactiveVars, TermCriteria(200,1000, 0.05));
	Ptr<RTrees> model;
	model = RTrees::create(RTrees::Params(maxDepth, minSampleCount, 0, false, maxCategories, Mat(), false, nactiveVars, TermCriteria(200,1000, 0.05)));
		
	// TRAIN THE RF
	model->train(training);

	// DEBUGGING: collect info on training, model and its parameters
	if (atoi(argv[5]) == 1) {
		Mat samples = training->getTrainSamples();
		Mat resps = training->getTrainResponses();
		Mat test_resps = testing->getTrainResponses();
		Mat classlabels = training->getClassLabels();

		//cout << "samples:" << endl << samples << endl; // LONG 
		cout << "resps:" << endl << resps << endl;
		cout << "test resps:" << endl << test_resps << endl;
		//cout << "classlabels:" << endl << samples << endl;

		Mat VarImp = model->getVarImportance();
		bool trained = model->isTrained();
		bool classif = model->isClassifier();

	 	MatConstIterator_<raw_datatype> it1=resps.begin();

		cout << "VarImps " << endl << VarImp << endl;
		cout << "trained?" << endl << trained << endl;
		cout << "classifier?" << endl << classif << endl;
	}

	// TEST THE TEST DATA\
	//float test_error = model->calcError(testing, false, OutputArray response); // BREAKS
	
	// OUTPUT AND COMPILE THE RESULTS
	confusion_matrix(testing, model);


	return EXIT_SUCCESS;
}