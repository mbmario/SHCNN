 void confusion_matrix(CvMLData* testing, CvRTrees* rtree) {

 	using namespace cv;
 	bool printstuff = FALSE; // print statements in loop for debugging
 	bool outputfile = FALSE; // print test values to file

 	const CvMat* values = testing->get_values();
 	int rows = values->rows;
 	int cols = values->cols; // predictors + response (should be 61) 
 	Mat values_m = Mat(values); // row.copyTo is enabled in Mat, but not CvMat

 	const CvMat* test_idx = testing->get_test_sample_idx();
 		// will be a single-row matrix of type CV_32SC1 (int)
 	int test_length = test_idx->cols;  // number of testing samples

 	int confusion_matrix[7][7] ={0};

	int ct; int idx = 0; // target rows of "values" which are testing data
 	int truth = 0; int pred=0; // ground truth and predictions
 	
 	Mat sample = Mat(1,cols, CV_32FC1); //CV_32FC1 is float

 	std::ofstream test_results;
 	test_results.open("test_results.txt");

	for (int i=0; i < test_length; i++) {

 		CvScalar scal = cvGet2D(test_idx, 0, i);
 		idx = scal.val[0]; //index of testing data entry on CvMLData testing 	

 		values_m.row(idx).copyTo(sample.row(0));
 			// access row idx, save as sample (Mat or CvMat*)
 		//Mat sample2 = sample.colRange(0, cols-1); // NEEDS THE TRUTH IN THE SAMPLE

 		pred = (int)rtree->predict(sample); // works!!
 		truth = (int)values_m.at<float>(idx, (cols-1)); // this works too!

 		confusion_matrix[truth][pred]++;

 		if (printstuff) {
 			std::cout << "index case/row " << idx << "\n";
 			std::cout << "sample values " << sample << "\n";
 			std::cout << "truth " << truth << " prediction " << pred << "\n";
			// to print confusion matrix for each case, copy-paste code here
 		}

 		if (outputfile) {
 			test_results << idx << ", " <<sample << ", predicted " << pred <<  ", truth "<< truth <<"\n";
 		}

 		ct++;
 	} // end for (i=0...)

 	if (printstuff) {
 		std::cout << "there were " << test_length << " samples and the loop ran ";
 		std::cout << ct << " times \n";
 	}

 	std::cout << "Confusion Matrix: \n";
 	for (int a=0; a<7; a++) { // print the confusion matrix
 		for (int b=0; b<7; b++) {
 			std::cout << confusion_matrix[a][b] << "\t";
 		}
 		std::cout << "\n";
 	}

	test_results.close(); 
	if (!outputfile) { remove("test_results.txt"); }

 } // end void