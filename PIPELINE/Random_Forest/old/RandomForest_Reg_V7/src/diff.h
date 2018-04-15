 void diff(CvMLData* testing, CvRTrees* rtree) {

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


	int ct = 0; int idx = 0; // target rows of "values" which are testing data
 	float truth = 0; float pred=0; // ground truth and predictions
 	float difference;

 	Mat sample = Mat(1,cols, CV_32FC1); //CV_32FC1 is float



	std::cout << "pred, truth, diff (pred - truth)" << "\n";

 	//std::ofstream test_results;
 	//test_results.open("test_results.txt");

	for (int i=0; i < rows; i++) {

 		values_m.row(i).copyTo(sample.row(0));

 		pred = (float)rtree->predict(sample);
 		truth = (float)values_m.at<float>(i, (cols-1));
 		difference = pred - truth;

 		std::cout << pred << ", " << truth << ", " << difference << std::endl;


 		ct++;
 	} // end for (i=0...)

 	if (printstuff) {
 		std::cout << "there were " << test_length << " samples and the loop ran ";
 		std::cout << ct << " times \n";
 	}
	
 } // end void