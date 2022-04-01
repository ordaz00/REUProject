#library(readr)

myData = read.delim("test.txt", header = FALSE)
l <- myData
print(typeof(l))