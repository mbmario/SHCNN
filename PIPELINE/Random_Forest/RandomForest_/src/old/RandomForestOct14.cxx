// RFMalig
// My version of RTrees for RFMalig
#include <cv.h>
#include <ml.h>
#include <stdio.h>
#include <fstream>


# include "print_data.h"
# include "print_tree.h"
# include "prediction_sample.h"
# include "confusion_matrix.h"

using namespace cv;

int main ( int argc, char * argv[]) {

  // arguments (4 or 5): [0] Randomforest.cxx, [1] training, [2] testing [3] response index, [4, OPTIONAL] variable types 
  if (argc <  4) {
      std::cerr << "Please supply training, testing, and response index" << std::endl;
  }

  
	// for a different dataset, make sure to change
	//		set_response_idx, set_var_types, 

	// SET THE DATA CONTAINER OBJECT
	//load the csv (training+testing to be split later) as a CvML data object
  CvMLData* csvdata = new CvMLData; 
	csvdata->read_csv(argv[1]);
  if (argc == 5) {
    csvdata->set_var_types(argv[5]); 
	}
  csvdata->set_response_idx(argv[3]);
  if (splitbool == TRUE) {
	 CvTrainTestSplit* spl = new CvTrainTestSplit(float(.70)); // no need for testing in RFs??
    csvdata->set_train_test_split(spl);
	 csvdata->mix_train_and_test_idx(); // mixes indices of training and testing
  }
	print_data(csvdata); // for checking purposes

	// SET THE RF OBJECT
	// weights of each classification/class
	float priors[] = {1,1,1,1,1,1}; // one for each class (6)
	//set parameters
    CvRTParams params = CvRTParams(25, // max depth; high will overfit, low underfit
      3, // min sample count required at a leaf node for it to be split (ideal is ~1% of total)
  		0, // regresssion accuracy: N/A here
      FALSE, // compute surrogate split for missing data
      15, // max number of categories for clusters/categories; keep lower to speed up
      priors, // the array of priors
      TRUE,  // calculate variable importance
      3, // changeable; number of variables randomly selected at node and used to find the best split(s).
      200, // max number of trees in the forest
      0.05f,	// forest accuracy
      CV_TERMCRIT_ITER |	CV_TERMCRIT_EPS // termination cirteria:
        //CV_TERMCRIT_ITER = max_num_of_trees.. met; CV_TERMCRIT_IPS = forest_accuracy met
    );
    // create, then load
   CvRTrees* rtree = new CvRTrees;
   rtree->train(csvdata, params);

   // confusion matrix 
   confusion_matrix(csvdata, rtree);

   // GET INFORMATION ABOUT ERROR
   //print_tree(rtree, TRUE); 
   float test_error = rtree->calc_error(csvdata, CV_TEST_ERROR);
   float train_error = rtree->calc_error(csvdata, CV_TRAIN_ERROR);
   //float proportion_incorrect = rtree->get_train_error(); takes undocumented special input


   std::cout << "test error is " << test_error << "\n"; 
   std::cout << "train error is " << train_error << "\n"; 
   //std::cout << "proportion incorrect is " << proportion_incorrect << "\n";


}