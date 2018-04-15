# split_fn.R
split_fn <- function(df, TEST=0.9) {
   len = nrow(df)
   full_idxv = 1:len
   
   testing_idxv = sample(full_idxv, round(TEST*len, 0))
   training_idxv = setdiff(full_idxv, testing_idxv)
   
   result <- list(training_idxv, testing_idxv)
   return(result)
}
