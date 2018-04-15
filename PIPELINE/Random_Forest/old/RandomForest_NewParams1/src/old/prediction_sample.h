void prediction_sample(CvRTrees* rtree) {
	using namespace cv;

	CvMLData pred_data;
	pred_data.read_csv("/home/mario/Documents/Mario_programs/RFMalig/suppfiles/Predictions.csv");
	const CvMat* values = pred_data.get_values();
	std::cout << rtree->predict(values, Mat()) << "\n";	
}