#!/usr/bin/Rscript

# reads the image_names and features_fc6 and appends them to data frame. Step 1.5 in data compiling

# you should run the now-update results_parser_full beforehand

setwd("/media/mario/DATAPART1/RFData/Raw_Data/")

# read the csvs converted from the matlab formats
features <- read.csv("features_fc6.csv") # this may take some time but it does work
feature_names <- read.csv("image_names.csv")

# load the df if it is not loaded already
load("/media/mario/DATAPART1/RFData/Parsed_Data/full_df_proc.Rda") 

