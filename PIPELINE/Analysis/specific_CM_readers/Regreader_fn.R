#Regreader_fn.R

Regreader_fn <- function(filename, pred_bool) {
  
    # if pred == TRUE, returns the mean of their predicitons 
    # otherwise, returns the mean difference
  
    nlines <- length(readLines(filename)); skip <- 2
    ptd_df <- read.table(filename, skip=skip, nrows=nlines-skip-3, sep=",") # will say tpd
    colnames(ptd_df) <- c("pred", "truth", "diff")
    
    # calculate the means and sds
    mean_diff1 <- mean(abs(ptd_df$diff[ptd_df$truth == 1]))
    mean_pred1 <- mean((ptd_df$pred[ptd_df$truth == 1]))
    
    mean_diff2 <- mean(abs(ptd_df$diff[ptd_df$truth == 2]))
    mean_pred2 <- mean((ptd_df$pred[ptd_df$truth == 2]))
    
    mean_diff3 <- mean(abs(ptd_df$diff[ptd_df$truth == 3]))
    mean_pred3 <- mean((ptd_df$pred[ptd_df$truth == 3]))
    
    mean_diff4 <- mean(abs(ptd_df$diff[ptd_df$truth == 4]))
    mean_pred4 <- mean((ptd_df$pred[ptd_df$truth == 4]))
    
    mean_diff5 <- mean(abs(ptd_df$diff[ptd_df$truth == 5]))
    mean_pred5 <- mean((ptd_df$pred[ptd_df$truth == 5]))

    diffv <- c(mean_diff1, mean_diff2, mean_diff3, mean_diff4, mean_diff5)
    predv <- c(mean_pred1, mean_pred2, mean_pred3, mean_pred4, mean_pred5)
  
    if(pred_bool) { return(predv)} else {return(diffv)}
}