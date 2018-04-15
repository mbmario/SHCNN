# SHQuery.R
# run after intro of results_parser_fulldf.R: run SHfiles line at least

lengths <- rep(0, length(SHfiles))

for (i in 1:length(SHfiles)) {
   SHlines <- readLines(paste0("../SHs/", SHfiles[i]))
   start <- grep("^Harmonic Map$", SHlines) + 1
   end <- length(SHlines)
   num_SHs <- end-start
   if(length(num_SHs) == 0) num_SHs = 0
   lengths[i] <- num_SHs
}

hist(lengths[lengths < 500], breaks=40)
