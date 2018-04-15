# results_df_print.R
# ORDER 3 of3
# takes dfs from results_sort_priority and prints them to training_files readable formats

# get list of data frames priority a,b,c,d

# for each data frame
   # print the full data frame
   write.table( priority_a, "priority_a.csv400", sep=",", row.names = FALSE, quote= FALSE)
   write.table( priority_b, "priority_b.csv400", sep=",", row.names = FALSE, quote= FALSE)
   write.table( priority_c, "priority_c.csv400", sep=",", row.names = FALSE, quote= FALSE)
   write.table( priority_d, "priority_d.csv400", sep=",", row.names = FALSE, quote= FALSE)
   
   # print for ML program
   write.table((priority_a[,8:ncol(priority_a)]), "priority_a_learnable400.csv", sep=",", row.names = FALSE, quote = FALSE)
   write.table((priority_b[,8:ncol(priority_b)]), "priority_b_learnable400.csv", sep=",", row.names = FALSE, quote = FALSE)
   write.table((priority_c[,8:ncol(priority_c)]), "priority_c_learnable400.csv", sep=",", row.names = FALSE, quote = FALSE)
   write.table((priority_d[,8:ncol(priority_d)]), "priority_d_learnable400.csv", sep=",", row.names = FALSE, quote = FALSE)
   