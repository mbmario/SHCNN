// print_tree.h
void print_tree(CvRTrees* rtree, bool VI) {
	using namespace cv;
	printf("Number of trees: %i \n", rtree->get_tree_count());
	Mat vimp = rtree->getVarImportance();
	int rows = vimp.rows;
	int cols = vimp.cols;
   	printf("variable importance rows: %i, cols: %i \n", rows, cols );
    std::cout << vimp << "\n";
 	

}
