#1
a<-1; b<-2
a;b
#함수 
function_name <- function(input){
  result <- input +1
  return(result)
}
function_name(2)
# 함수 전체 내용(구조) 확인
function_name
lapply
#함수 기본 입력값 설정
1)
g <- function(x){
  result <- x+1
  return(result)
}
g(2)
2) 
g <- function(x=3){
  result <- x+1
  return(result)
}
g()
#return()
find_abs <- function(x){
  if(x>0){
    return(x)
  }
  -1*x
}
find_abs(-1)
#최대값 위치 찾는 함수
set.seed(100)
my_vec <- sample(1:100,30)
my_vec
find_max <- function(x){
  which.max(x)
}
find_max(my_vec)
#if else 구문
x<-3; y<-0
if(x>4){
  y<-1 
} else{
  y<-2
}
y
#switch
x<-1;y<-2;input<-"good"
switch(
  input,
  "good" = cat("score=", x+y),
  "normal" = cat("score", 2*x),
  "bad" = cat("score", -y)
)
#반복문
x<- 1:3
for(i in x){
  print(paste("here is", i))
}
i<-1
while(TRUE){
  i<-i+3
  if(i>10) break
  print(i)
}




