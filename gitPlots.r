library(ggplot2)

df = read.csv("TensorFlow_Commit_Stats.csv")
list1 = list()
for(i in 1:ncol(df)) {      
  list1[[i]] <- df[ , i]    
}
names(list1)=colnames(df)
#print(df)
DF <- as.data.frame(list1)
ggplot(DF, aes(num1)) + geom_histogram(bins=25) + ggtitle("Pytorch Commits Histogram") +labs(y= "Authors who made that many commits", x = "Number of Commits")
ggsave("TensorFlow_Commit_Stats.pdf")

df = read.csv("TensorFlow_Fraction_Stats.csv")
list1 = list()
for(i in 1:ncol(df)) {      
  list1[[i]] <- df[ , i]    
}
names(list1)=colnames(df)
#print(df)
DF <- as.data.frame(list1)
ggplot(DF, aes(num1)) + geom_histogram(bins=10) + ggtitle("Pytorch Fractions Histogram") +labs(y= "Authors at that fraction", x = "Fraction")
ggsave("TensorFlow_Fraction_Stats.pdf")
