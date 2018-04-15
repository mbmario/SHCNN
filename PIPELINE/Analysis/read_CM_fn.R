read_CM_fn <- function(filename, oboBOOL) {
  
  # if file has "using default params" then change skip to 2
   mat = read.table(filename, skip=2, nrows=7, sep="\t") 
   correct = 0
   obo = 0
   total = 0
   
   for (i in 1:6) {
      total = total + sum(mat[,i])
      correct = correct + sum(mat[i,i])
      obo = obo + sum(mat[(i-1):(i+1),i]) # can be either way with same results
   }
   accuracy = correct/total
   obo_accuracy = obo/total
#     cat("filename: ", filename, "\n")
#     cat("total", total, "obo", obo, "correct", correct, "\n")
#     cat("accuracy \n")
#     cat(accuracy, "\n")
#     cat("obo accuracy \n")
#     cat(obo_accuracy, "\n")
   if (oboBOOL) {
      return(obo_accuracy)
   } else {
      return(accuracy)
   }
}