read_CM_more_fn <- function(filename, acm_bool) {
  # reads file and prints as csv:
    # aggregate confusion matrix if acm == TRUE
    # truetruth if acm == FALSE  
  # runs for each files
  
  acm <- matrix(0,7,7)
  mat <- read.table(filename, skip=2, nrows=7, sep="\t")[,1:7] # rows are truth
  acm <- acm + data.matrix(mat)
  true_truth_freq <- diag(acm)/rowSums(acm)
  cts <- rowSums(acm)
  
  if (acm_bool) {
      return(acm)
  }else {
      return(true_truth_freq)
  }
  
}