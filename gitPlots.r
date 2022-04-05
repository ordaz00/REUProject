library(ggplot2)
names <- list("Ruby_On_Rails", "Lucene", "TensorFlow", "Pytorch")
for(i in names){
  csv1 = paste(i,"_Commit_Stats.csv",sep="")
  csv2 = paste(i,"_Fraction_Stats.csv",sep="")
  title1 =paste(i,"_Commit_Stats.pdf",sep="")
  title2 =paste(i,"_Fraction_Stats.pdf",sep="")

  df = read.csv(csv1)
  list1 = list()
  for(i in 1:ncol(df)) {      
   list1[[i]] <- df[ , i]    
  }
  names(list1)=colnames(df)
  DF <- as.data.frame(list1)
  ggplot(DF, aes(num1)) + geom_histogram(bins=25) + ggtitle("Pytorch Commits Histogram") +labs(y= "Authors who made that many commits", x = "Number of Commits")
  ggsave(title1)

  df = read.csv(csv2)
  list1 = list()
  for(i in 1:ncol(df)) {      
    list1[[i]] <- df[ , i]    
  }
  names(list1)=colnames(df)
  DF <- as.data.frame(list1)
  ggplot(DF, aes(num1)) + geom_histogram(bins=10) + ggtitle("Pytorch Fractions Histogram") +labs(y= "Authors at that fraction", x = "Fraction")
  ggsave(title2)
}