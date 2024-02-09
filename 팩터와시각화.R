#1 factor
x <- c(1,13,5,2,1) 
x_factor <- factor(x)
x_factor
class(x_factor)
unclass(x_factor)
#레벨 조정하기
levels(x_factor) <- paste("school", 1:4)
x_factor
#순위 변수
con_vector <- c("bad", "good", "soso", "good")
x_factor2 <- factor(con_vector, levels = c("bad", "soso", "good"),
                    ordered = T)
x_factor2
#tapply
age <- sample(20:60,6)
gender <- sample(c("남자", "여자"),6, replace = T)
tapply(age, gender, mean)
#split
x_factor
split(1:5, x_factor)
#시각화
plot(0,0,
     xlim = c(0,10),
     ylim = c(0,20),
     type = "n",
     xlab = "x title",
     ylab = "y title",
     main = "main title")
     points(1:10, 1:10, col ="red")
     abline(a=20, b=-2, lty = "dashed")
