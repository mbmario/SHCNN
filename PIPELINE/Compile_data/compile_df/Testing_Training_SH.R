# writes the testing and training files that will be then processed by the python script, and then random forested 

# needs write_tt_fn and split_fn 

# priority_a thru d should be loaded into the environment

TEST=0.1
setwd("/media/mario/DATAPART1/RFData/Input_SmallWindows")

# WRITE_TT
# write_tt <- function(df, start_col_idx, filename, TEST) { writes filename + _testing.csv and _training.csv
# always prints "key"

# COLUMN NAMES
#  [1] key, "x_center", "y_center",  [4] "z_center", "patientlevel", "patient", "level", "volume", "Subtlety"             
# [10] "Internal.Structure", "Calcification", "Sphericity", [13] "Margin", "Lobulation", "Spiculation", [16] "Radiographic.Solidity
# [17] numSHs [18] SH1 ... [418] malignancy

# NOT INCLUDING SIZES AND SH COUNTS

# PrACNN
write_tt_fn(priority_a, 18, 1, "/media/mario/DATAPART1/RFData/Input_SmallWindows_CNNonly/PrACNN/t1/pa_smcnnonly", .1)
write_tt_fn(priority_a, 18, 1, "/media/mario/DATAPART1/RFData/Input_SmallWindows_CNNonly/PrACNN/t2/pa_smcnnonly", .1)
write_tt_fn(priority_a, 18, 1, "/media/mario/DATAPART1/RFData/Input_SmallWindows_CNNonly/PrACNN/t3/pa_smcnnonly", .1)
write_tt_fn(priority_a, 18, 1, "/media/mario/DATAPART1/RFData/Input_SmallWindows_CNNonly/PrACNN/t4/pa_smcnnonly", .1)
write_tt_fn(priority_a, 18, 1, "/media/mario/DATAPART1/RFData/Input_SmallWindows_CNNonly/PrACNN/t5/pa_smcnnonly", .1)

# PrBCNN
write_tt_fn(priority_b, 18, 1, "/media/mario/DATAPART1/RFData/Input_SmallWindows_CNNonly/PrBCNN/t1/pb_smcnnonly", .1)
write_tt_fn(priority_b, 18, 1, "/media/mario/DATAPART1/RFData/Input_SmallWindows_CNNonly/PrBCNN/t2/pb_smcnnonly", .1)
write_tt_fn(priority_b, 18, 1, "/media/mario/DATAPART1/RFData/Input_SmallWindows_CNNonly/PrBCNN/t3/pb_smcnnonly", .1)
write_tt_fn(priority_b, 18, 1, "/media/mario/DATAPART1/RFData/Input_SmallWindows_CNNonly/PrBCNN/t4/pb_smcnnonly", .1)
write_tt_fn(priority_b, 18, 1, "/media/mario/DATAPART1/RFData/Input_SmallWindows_CNNonly/PrBCNN/t5/pb_smcnnonly", .1)











