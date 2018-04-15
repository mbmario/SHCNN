#include <opencv2/core.hpp>
//#include <opencv2/cv.hpp>
#include <opencv2/ml.hpp>

#include <stdio.h>
#include <fstream>

using namespace std;
using namespace cv;
using namespace cv::ml;


void confusion_matrix(TrainData* testing, RTrees* rtree) {

 	bool printstuff = true; // print statements in loop for debugging
 	bool outputfile = false; // print test values to file

 	Mat values = testing->getTrainSamples();
 	Mat resps = testing->getTrainResponses();

 	int rows = values.rows;
 	int cols = values.cols; 
 	
 	int test_length = cols; // number of testing samples

 	int confusion_matrix[7][7] ={0}; // results!

 	cout << resps << endl;

	int ct = 0;
	int idx = 0; // target rows of "values" which are testing data
 	int truth = 0; int pred=0; // ground truth and predictions
 	
 	Mat sample = Mat(1,cols, CV_32FC1); //CV_32FC1 is float

 	int* ptr1 = (int *)resps.data;

 	

	for (int i=0; i < rows; i++) { // iterate over testing df

 		values.row(i).copyTo(sample.row(0)); // sample: 

 		pred = (int)rtree->predict(sample);
 		truth = resps.at<int>(i, 0);

 		confusion_matrix[truth][pred]++;

 		if (printstuff) {
 			std::cout << "index case/row " << i << std::endl;
 			//std::cout << "sample values " << sample <<  std::endl;
 			std::cout << "truth " << truth << " prediction " << pred << std::endl;
			// to print confusion matrix for each case, copy-paste code here
 		}
 		ct++;
 	} // end for (i=0...)

 	if (printstuff) {
 		std::cout << "there were " << cols << " features and the loop ran ";
 		std::cout << ct << " times" << std::endl;
 	}


 	std::cout << "Confusion Matrix:" << std::endl;
 	for (int a=0; a<7; a++) { // print the confusion matrix
 		for (int b=0; b<7; b++) {
 			std::cout << confusion_matrix[a][b] << "\t";
 		}
 		std::cout << std::endl;
 	}

} // end void