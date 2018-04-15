load("/media/mario/DiskB/LIDC_Data_Current/RFData/Parsed_Data/priority_a_df")
load("/media/mario/DiskB/LIDC_Data_Current/RFData/Parsed_Data/priority_b_df")

priority_a$radmm <- (((3000*as.numeric(priority_a$volume))/(4*pi))^(1/3)) # should be mm
priority_b$radmm <- (((3000*as.numeric(priority_b$volume))/(4*pi))^(1/3))

u4pa <- priority_a[priority_a$radmm < 4,]
btw46pa <-priority_a[(priority_a$radmm < 6 & priority_a$radmm > 4),]
o6pa <- priority_a[priority_a$radmm > 6,] 
o4pa <- priority_a[priority_a$radmm > 4,]

o25pa <- priority_a[priority_a$radmm  > 2.5,]
o3pa <- priority_a[priority_a$radmm > 3,]

df <- u4pa 
df <- btw46pa
df <- o6pa
df <- o4pa