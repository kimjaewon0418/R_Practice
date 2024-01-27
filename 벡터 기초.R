#1
x <- c(5,3,2)
x
#2
x <- c(1:5)*2
x
#3
seq(2,10, by=2)
seq(2,10, length=3)
#4
rep(4,4)
rep(c(1:4),2)
rep(c(1:4), each=2)
#5
x <- 1:10*2
x
x[3:6]
x[c(2,2,4,3)]
x[-1]
#6
x
all(x<10)
any(x<10)
#7
x[x ==4]
x[x %%4==0]
x[x != 4]
x[x%/% 4 ==2]
y <- 1:500
y
sum(y %% 26 ==0)
length(y[y %% 26 ==0])
#8
a <- c(TRUE, TRUE, FALSE)
b <- c(TRUE, FALSE, FALSE)
a & b
a | b
a && b
a || b
x[x ==4 | x>15]
#9
x<7
which(x<7)
y[y %% 25 ==10][3]
y[which(y %% 25 ==10)[3]]
#10
c <- c(20, NA, 13, 24, 309)
mean(c)
mean(c, na.rm = T)
#11
my_vector <- c(1,20,300)
names(my_vector) <- c("first", "second", "third")
my_vector
