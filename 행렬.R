#1
cbind(1:4, 12:15)
dim(cbind(1:4, 12:15))
#2
y <- matrix(1:4, nrow=2)
y[2,2]
matrix(1:6, nrow=2)
matrix(1:6, nrow=2, byrow=T)
#3
x <- matrix(1:10*2, ncol=2)
x
x[,2]
x[c(2,3,4),2]
#4
set.seed(2021)
img1 <- matrix(runif(9), ncol=3)
img1
#5
class(img1)
attributes(img1)
x<-1:10
class(x)
#6
x <- matrix(1:10*2, nrow=5)
x
t(x)
#7
dim(x)
dim(y)
x %*% y
#8
y * c(1,2)
#9
mat1 <- matrix(1:6, nrow=2)
mat2 <- matrix(7:12, nrow=2)
my_array <- array(data=c(mat1, mat2), dim = c(2,3,2))
my_array
