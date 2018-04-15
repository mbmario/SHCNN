// RandomForest.cxx

#include <cv.h>
#include <ml.h>
#include <stdio.h>
#include <fstream>


# include "print_data.h"
//# include "print_tree.h"
//# include "prediction_sample.h"
# include "confusion_matrix.h"

using namespace cv;

int main ( int argc, char * argv[]) {

   // arguments (6): [0] Randomforest.cxx, [1] training, [2] testing, 
   // [3] response index, [4] variable types, [5] print extra output (1 == print, ~1 == don't) 
   if (argc <  6) {
      std::cerr << "Please supply training, testing, response index, types, 1:printstuff" << std::endl;
   }

  
   // SET THE DATA CONTAINER OBJECTS
   CvMLData* training = new CvMLData; 
   CvMLData* testing = new CvMLData; 
	training->read_csv(argv[1]);
   testing->read_csv(argv[2]);

   training->set_var_types(argv[4]); 
   testing->set_var_types(argv[4]); 
      // WORKING: "ord[0,9-59],cat[1-8,60]"
	
   training->set_response_idx(atoi(argv[3]));
   testing->set_response_idx(atoi(argv[3]));

   bool printstuff = FALSE;
   if (atoi(argv[5]) == 1) {
      printstuff = TRUE;
      std::cout << "training; "; 
      print_data(training); // prints all input info, outputs to matrix.txt
      std::cout << "testing; "; 
      print_data(testing);
   }

	// SET THE RF OBJECT

	// weights of each classification/class
	float priors[] = {1,1,1,1,1,1}; // one for each class (6)

	//set parameters
   CvRTParams params = CvRTParams(25, // max depth; high will overfit, low underfit
      3, // min sample count required at a leaf node for it to be split (ideal is ~1% of total) SAMPLES
  		0, // regresssion accuracy: N/A here
      FALSE, // compute surrogate split for missing data
      15, // max number of categories for clusters/categories; keep lower to speed up
      priors, // the array of priors
      TRUE,  // calculate variable importance
      3, // changeable; number of variables randomly selected at node and used to find the best split(s).+ FEATURES
      200, // max number of trees in the forest
      0.05f,	// forest accuracy
      CV_TERMCRIT_ITER |	CV_TERMCRIT_EPS // termination cirteria:
        //CV_TERMCRIT_ITER = max_num_of_trees.. met; CV_TERMCRIT_IPS = forest_accuracy met
   );

   // create, then load
   CvRTrees* rtree = new CvRTrees;
      rtree->train(training, params);

   // confusion matrix 
   confusion_matrix(testing, rtree); // prints stuff to std::cout


   // GET INFORMATION ABOUT ERROR
   //print_tree(rtree, TRUE); 
   float test_error = rtree->calc_error(training, CV_TEST_ERROR);
   float train_error = rtree->calc_error(training, CV_TRAIN_ERROR);
   Mat varImp = rtree->getVarImportance();

   std::cout << "test error is: " << test_error << "\n"; 
   std::cout << "train error is: " << train_error << "\n"; 
   std::cout << "Variable Importance \n" << varImp << "\n";
}