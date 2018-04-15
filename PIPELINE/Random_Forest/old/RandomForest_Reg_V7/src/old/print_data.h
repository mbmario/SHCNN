#include <opencv/cv.hpp>
#include <opencv/ml.hpp>
using namespace cv;
void print_data(CvMLData*  data);

//use for debugging
void print_data(CvMLData*  data)  { 
	printf ("OpenCV version %s (%d.%d.%d)\n",
            CV_VERSION,
            CV_MAJOR_VERSION, CV_MINOR_VERSION, CV_SUBMINOR_VERSION);
	printf("print_data: Object CvMLData \n");
	printf("delimiter is %c \n", data->get_delimiter());
	const CvMat* Mat_ptr = data->get_values(); // CvMat is allegedly fully compatible w/ Cv's Mat
	int rows = Mat_ptr->rows; // Mat_ptr is CvMat*
	int cols = Mat_ptr->cols;
	printf("dims: %i rows, %i cols  \n", rows, cols );
	printf("response index is col %i \n", data->get_response_idx());
	printf("Types: 0 is ordered, 1 is categorical: \n");
	for (int i = 0; i < cols; i++) {
		printf("Col %i is %i ,", i, data->get_var_type(i));
	}
	printf("\n DATA MATRIX:");
	std::ofstream myfile;
	myfile.open("matrix.txt");
	myfile << Mat(Mat_ptr) << "\n";
	myfile.close();
	//return rows;


} 