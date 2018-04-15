read_CM_frequencies <- function(filename) {
  
  # oboBOOL : if true, returns obo proportion
  # trueBOOL : if true, returns true proportion
  # totalBOOL : if true, returns totals
  
  # rows are truth, cols are pred
  
  # if file has "using default params" then change skip to 2
   mat <- read.table(filename, skip=2, nrows=7, sep="\t") 
   mat <- mat[,1:7] # chop off NA
   
   obo <- rep(0,7)
   accurate <- rep(0,7)
   
   total <- rep(0,7)
   
   for (i in 2:6) { # 0 thru 6
      
     accurate[i] <- (mat[i,i])/sum(mat[i,])
     obo[i] <- (mat[i, i-1] + mat[i,i] + mat[i, i+1])/sum(mat[i,])
     
     total[i] <- sum(mat[i,])
   
   }
   
   return(list(obo, accurate, total))
   
}