rm(list=ls())
getwd()

#Load Libraries
library(plyr)
library(utils)
library(RJSONIO)
library(splitstackshape)

#import
files <- list.files(path = "~/Data/Profile Page/")
filenames <- paste("~/Data/Profile Page/", files, sep="")

read_csv_filename <- function(filename){
  ret <- read.csv(filename)
  ret$Source <- filename #EDIT
  ret
}

import.list <- ldply(filenames, read_csv_filename)
head(import.list)

table(import.list$Source)
names(import.list)
x = import.list[!duplicated(trimws(import.list$Email.Address)), ]
length(import.list$Email.Address) #duplicated
length(x$Email.Address) #deduplicated

write.csv(x, "~/Data/Profile Page/Deduped Newsletter emails.csv", row.names = F)
