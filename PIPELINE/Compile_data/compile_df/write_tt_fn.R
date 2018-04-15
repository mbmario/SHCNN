write_tt_fn <- function(df, start_col_idx, SHcount, filename, TEST) {
   
   end <- 18 + SHcount - 1 # 150: 167; 200: 217; 400: 417
   
   # for additional columns, include a vector parameter that can be merged with the one in the following line
   
      df <- df[,c(1, 8, 17, start_col_idx:end, length(df))] # remove everything except for "key" and select
      testing_name <- paste0(filename, "_testing_pre.csv")
      training_name <- paste0(filename, "_training_pre.csv")

   
   split_row_idx <- split_fn(df, TEST) # index of [[1]] training, [[2]] testing
   write.table(df[split_row_idx[[2]],], file=testing_name, sep=",", quote=FALSE, col.names = FALSE, row.names = FALSE)
   write.table(df[split_row_idx[[1]],], file=training_name, sep=",", quote=FALSE, col.names = FALSE, row.names = FALSE)
   
}
