#1
data.frame(col1= c("one","two","three","four","five"),
           col2 = c(6:10))
#2 활용
name <- c("issac", "bomi")
birhmonth <- c(5,4)
my_df <- data.frame(name, birhmonth)
my_df
# 접근방식
my_df$name
my_df[[1]]
my_df[,1]
#na 제거
complete.cases()
