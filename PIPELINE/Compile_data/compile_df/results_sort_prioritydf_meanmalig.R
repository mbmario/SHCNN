# results_sort_prioritydf.R
# ORDER 2 of 3
# takes df from results_parser_full.R and sorts them into separate a,b,c,d priority dfs

# fulldf will have # name, patient-level, patient, level, size, chars, num_SHs, SHs, malignancy
setwd('/media/mario/DATAPART1/RFData/Parsed_Data')
load("full_df_proc.Rda")

# make a empty data frame, built on names 
new_df <- data.frame(matrix(0, nrow(full_df), ncol(full_df)), stringsAsFactors=TRUE)
names(new_df) <- names(full_df)
new_df$key <- as.character(new_df$key)
new_df$patientlevel <- as.character(new_df$patientlevel)
new_df$volume <- as.character(new_df$volume)

# copy it for other ones
priority_a = data.frame(new_df)
priority_b = data.frame(new_df)
priority_c = data.frame(new_df)
priority_d = new_df

a_idx = 1; b_idx = 1; c_idx = 1; d_idx = 1

# loop over unique patient/level combos
plidx = unique(full_df$patientlevel)

for (i in 1:length(unique(plidx))) {
   subset = full_df[full_df$patientlevel==plidx[i],] 
   random = sample(1:nrow(subset))
  # cat("testing unique patientlevel:", plidx[i], "\n")
  # cat("has random vector: ", random, "\n")
   if (length(random) > 0) {
      priority_a[a_idx,] = subset[random[1],]
      a_idx = a_idx + 1
   } 
   if (length(random) > 1) {
      priority_b[b_idx,] = subset[random[2],]
      b_idx = b_idx + 1
   } 
   if (length(random) > 2) {
      priority_c[c_idx,] = subset[random[3],]
      c_idx = c_idx + 1
   } 
   if (length(random) == 4) {
      priority_d[d_idx,] = subset[random[4],]
      d_idx = d_idx + 1
   } 
   if (sum(length(random) == c(1,2,3,4)) !=1 ) { 
      View(subset);
      cat("error on case ", plidx[i], "\n")
      cat("length of random: ", length(random), "\n")
      cat("error: patientlevel subset is too long \n")
   }
}

# remove empty rows
priority_a <- priority_a[!priority_a$key == "0",]
priority_b <- priority_b[!priority_b$key == "0",]
priority_c <- priority_c[!priority_c$key == "0",]
priority_d <- priority_d[!priority_d$key == "0",]

savedir <- "/media/mario/DATAPART1/RFData/Parsed_Data"
setwd(savedir)
save(priority_a, file="priority_a_df")
save(priority_b, file="priority_b_df")    
save(priority_c, file="priority_c_df")
save(priority_d, file="priority_d_df")
