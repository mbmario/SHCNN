#off2Gu.R

# takes directory arg where off directory is present and builds .m directory
# ideally to be called from E:\3D_Shapes_Project\Main.m
# because Matlab sucks

library(tools)

#RscriptPath = "C:\Users\butymd\Documents\R\R-3.1.2\bin\Rscript.exe"
#

# directory args stuff: [1] parent dir of off dir (had default), tests if dir
# [2] path where Gu files should be saved
{
  args <- commandArgs(trailingOnly = TRUE)
  if (!is.na(file.info(args[1])$isdir) && file.info(args[1])$isdir) {
    dir = args[1]   
    cat("Looking for off dir in directory:", dir, "\n")
  } else {
    print("args[1] is NA or args[1] is NOT a directory: changing to default")
    dir <- "E:/3D_Shapes_Project/Data/LDHD/Liver" # set to parent dir of off files -- remember / direction!
  }
  if (!is.na(file.info(args[2])$isdir) && file.info(args[2])$isdir) {
    out_dir = args[2]   
    cat("Will write special meshes to directory:" , out_dir, "\n") 
  } else {
    print("args[2] is NA or args[2] is NOT a directory: changing to default")
    out_dir <- "E:/3D_Shapes_Project/Data" # set to parent dir of off files -- remember / direction!
  }
  cat("dir ", dir, "\n", "out_dir ", out_dir, "\n")
}

setwd(dir)
off <- paste(dir, "/off", sep="")
files <- list.files(path=off, full.names=TRUE, pattern="*.off")
if (length(files) == 0) { # prints message for off files; assumes normals
  cat("can't find any .off files in directory", dir, "\n")
}

for (file in files) {
  
  # file stuff
  setwd(off)
  name <- basename((file_path_sans_ext(file)))
  saveto <- paste(out_dir, "/", name, "_specialMesh.m", sep="")
  
  # read header info, vertices, and faces
  contents <- readLines(file, n=2)
  vs_n = as.numeric(strsplit(contents[2], split=" ")[[1]][1])
  face_n = as.numeric(strsplit(contents[2], split=" ")[[1]][2])
  
  # vertices: vs_n of them (compile & rearrange) 
  vertices <- read.table(file, skip=2, sep=" ", nrows=vs_n)
  if (!is.null(vertices$V4)) {
    vertices$V4 <- NULL
  }
  vertices$vertex  <- rep("Vertex", vs_n) # add "vertex" part
  vertices$index <- paste(1:vs_n, " ", sep="") 
  vertices <- vertices[,c(4,5,1,2,3)]        
  
  # faces: face_n of them (compile & rearrange)
  faces <- read.table(file, skip=vs_n+2, sep=" ")
  faces$V2 <- faces$V2 + 1
  faces$V3 <- faces$V3 + 1
  faces$V4 <- faces$V4 + 1
  faces$vertex <- rep("Face", face_n)
  faces$index <- paste(1:face_n, " ", sep="")
  faces <- faces[,c(5,6,2,3,4)]
  
  # normals: vs_n of them (compile)
  normal_name <- paste(name, "_normal.txt", sep="")
  normals = read.table(normal_name, sep=",")
  
  # add normals onto vertices df
  vertices$n_begin <- paste0(rep("{normal=(", vs_n),  sprintf("%06.5f", (normals$V1)))
  vertices$middle <- normals$V2
  vertices$n_end <- paste0(sprintf("%06.5f", (normals$V3)), rep(")}", vs_n))
  
  # save to file with path -- create new directory in ML if you want
  saveto <- file(saveto, open="wb")
  write.table(vertices, saveto, row.names=FALSE, col.names=FALSE, quote=FALSE, eol="\n")
  write.table(faces, saveto, append=TRUE, row.names=FALSE, col.names=FALSE, quote=FALSE, eol="\n")
  close(saveto)
  
  
}
