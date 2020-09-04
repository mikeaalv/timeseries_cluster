#this script look through all UCR data set and combine readme information into one text file
rm(list=ls())
options(warn=1)
options(stringsAsFactors=FALSE)
options(digits=15)
require(stringr)
require(magrittr)
dirpath="/Users/yuewu/Dropbox (Edison_Lab@UGA)/Projects/Bioinformatics_modeling/data/UCRArchive_2018/"
dirres="/Users/yuewu/Dropbox (Edison_Lab@UGA)/Projects/Bioinformatics_modeling/time_series_clustering/result/"
descriptions=c()
dirs=list.dirs(dirpath,full.names=FALSE,recursive=FALSE)
except=c("Missing_value_and_variable_length_datasets_adjusted")
dirs=dirs[!dirs %in% except]
for(subdir in dirs){
  descrfile=paste0(dirpath,subdir,"/README.md")
  templine=readLines(descrfile,warn=FALSE)
  descriptions=c(descriptions,"################",subdir,templine)
}
cat(descriptions,file=paste0(dirres,"readme_comb.txt"),sep="\n")
