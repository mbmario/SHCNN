# Gu2off.R
library(tools)

#RscriptPath = "C:\Users\butymd\Documents\R\R-3.1.2\bin\Rscript.exe"
#

# directory args stuff: 
#[1] parent dir of Gu meshes (had default), tests if dir
#[2] path where off files should be saved, tests if dir
{
  args <- commandArgs(trailingOnly = TRUE)
  if (!is.na(file.info(args[1])$isdir) && file.info(args[1])$isdir) {
    dir = args[1]   
    cat("Looking for Gu File (_specialMesh.m) directory in directory:", dir, "\n")
  } else {
    print("args[1] is NA or args[1] is NOT a directory: changing to default")
    dir <- "E:/3D_Shapes_Project/Data/Gu2off_test" # set to parent dir of off files -- remember / direction!
  }
  if (!is.na(file.info(args[2])$isdir) && file.info(args[2])$isdir) {
    out_dir = args[2]   
    cat("Will off to directory:" , out_dir, "\n") 
  } else {
    print("args[2] is NA or args[2] is NOT a directory: changing to default")
    out_dir <- "E:/3D_Shapes_Project/Data/Gu2off_test" # set to parent dir of off files -- remember / direction!
  }
  cat(" dir ", dir, "\n", "out_dir ", out_dir, "\n")
}

dir <- "E:/3D_Shapes_Project/Data/Tests_MC/Tests_MC_Gu_format"
out_dir <- "E:/3D_Shapes_Project/Data/Tests_MC/back2off"

setwd(dir)
files <- list.files(path=dir, full.names=TRUE, pattern= (".*[_specialMesh]{1}[.sphere]?[.m]+$"))
if (length(files) == 0) { # prints message for off files; assumes normals
  cat("can't find any Gu mesh files in directory", dir, "\n")
}

for (file in files) {
  
  name <- basename((file_path_sans_ext(file)))
  short_name <- sub("_specialMesh", "", name)
  saveto <- paste(out_dir, "/", short_name, ".off", sep="")
  
  contents <- readLines(file)
  if(grepl("[u]+[v]?", contents[1])) tex = TRUE else tex = FALSE # tex: has texture/color vertices
  
  vs_n <- grep("Face", contents, value=FALSE)[1] - 1 # number of vertices
  face_n <- length(contents) - vs_n # number of faces
  
  vertices <- read.table(file, sep=" ", nrows = vs_n) 
  faces <- read.table(file, sep=" ", skip = vs_n, nrows = face_n)
  # may or may not be extra space col. in faces
  if (ncol(faces) ==5) faces$V3 <- faces$V3 - 1 else faces$V6 <- faces$V6 - 1 
    faces$V4 <- faces$V4 - 1
    faces$V5 <- faces$V5 - 1  

  # fix texture vertices for tex=TRUE files
  if(tex) {
    vertices$V9 <- gsub("[u][.]*[=(]+", "", vertices$V9)
    vertices$V11 <- gsub("[)}]", "", vertices$V11)
  }
  
  saveto <- file(saveto, open="wb")
  if (tex) flag <- "COFF" else flag <- "OFF"
  write.table(flag, saveto, eol="\r\n", row.names=FALSE, append=TRUE, quote=FALSE, col.names=FALSE)

  write.table(paste0(vs_n, " ", face_n, " 0", sep=""), saveto, eol="\r\n", row.names=FALSE, append=TRUE, 
              quote=FALSE, col.names=FALSE)
  
  if(!tex) { # write vertices w/o texture: MAY NEED ANOTHER IF FOR SPACE/NOSPACE COL
  write.table(data.frame(vertices$V4, vertices$V5, vertices$V6), saveto, append=TRUE, eol="\r\n", 
              row.names=FALSE, col.names=FALSE, quote=FALSE)
  } else { # write vertices w/ texture, and alpha =.75
    write.table(data.frame(vertices$V3, vertices$V4, vertices$V5, vertices$V9, vertices$V10, vertices$V11, 
              rep(.75, vs_n)), saveto, append=TRUE, eol="\r\n", row.names=FALSE, col.names=FALSE, quote=FALSE)  
  }
  
  if(ncol(faces) ==5) {
  write.table(data.frame(rep(3, face_n), faces$V3, faces$V4, faces$V5), 
              saveto, append=TRUE, eol="\r\n", row.names=FALSE, col.names=FALSE)
  } else {
    write.table(data.frame(rep(3, face_n), faces$V4, faces$V5, faces$V6), 
                saveto, append=TRUE, eol="\r\n", row.names=FALSE, col.names=FALSE)  
  }
  close(saveto)
}
            
  