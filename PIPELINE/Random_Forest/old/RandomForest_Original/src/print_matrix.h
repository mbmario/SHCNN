//use for debugging; rewrite with pointer
void print_matrix(CvMLData*  data)  { 
	printf("print_matrix: Object CvMLData \n");
	const CvMat* Mat_ptr = data->get_values(); // CvMat is fully compatible w/ Cv's Mat
	int rows = Mat_ptr->rows;
	int cols = Mat_ptr->cols;
	printf("dims: %i rows, %i cols  \n", rows, cols );
	printf("response index is %i \n", data->get_response_idx());
	printf("0 is ordered, 1 is categorical: \n");
	for (int i = 0; i < cols; i++) {
		printf("Col %i is %i \n", i, data->get_var_type(i));
	}
} 