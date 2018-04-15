 void printdiffs(CvMLData* testing, CvRTrees* rtree) {

 	using namespace cv;
 	bool printstuff = false; // print statements in loop for debugging
 	bool outputfile = false; // print test values to file

 	const CvMat* values = testing->get_values();
 	int rows = values->rows;
 	int cols = values->cols; // predictors + response (should be 61) 
 	Mat values_m = Mat(values); // row.copyTo is enabled in Mat, but not CvMat

 	//const CvMat* test_idx = testing->get_test_sample_idx();
 		// will be a single-row matrix of type CV_32SC1 (int)
 	
 	int test_length = cols; //test_idx->cols;  // number of testing samples

 	int confusion_matrix[7][7] ={0};

	int ct = 0; int idx = 0; // target rows of "values" which are testing data
 	int truth = 0; int pred=0; // ground truth and predictions
 	int diff = 0;
 	
 	Mat sample = Mat(1,cols, CV_32FC1); //CV_32FC1 is float

 	if (printstuff) {
 		std::cout << values_m << "\n";
 	}
 	//std::ofstream test_results;
 	//test_results.open("test_results.txt");

	for (int i=0; i < rows; i++) {

 		values_m.row(i).copyTo(sample.row(0));

 		pred = (int)rtree->predict(sample);
 		truth = (int)values_m.at<float>(i, (cols-1));
 		diff = truth - pred;

 		std::cout << "first SHs" << values_m.at<float>(i, 0);
 		std::cout << ", " << values_m.at<float>(i, 1) << ", " << values_m.at<float>(i, 2);
 		std::cout << ", truth:" << truth  << "pred:" << pred << ", diff:" << diff << "\n";
		
 	}

	
 } // end void