library(readxl)
library(ggplot2)
data <- read_excel('man_height.xlsx')

# 모집단 평균 175, 분산 6
data <- read_excel('man_height.xlsx')
z <- (mean(data$키)-175)/(6/sqrt(length(data$키)))
print(z)


ggplot() +
  stat_function(data=data, aes(x=키, col='red'), fun=dnorm, args=c(mean=mean(data$키), sd=sd(data$키))) +
  stat_function(data=data.frame(x=c(160:180)), aes(x=c(160:180)), fun=dnorm, args=c(mean=175, sd=5))


install.packages("BSDA")
library("BSDA")
z.test(x=data, alternative = "two.sided", mu=175, sigma.x=6, conf.level = 0.95)




# 모집단 평균 175
# 유의 수준 0.05
# 양측 검정 : TRUE
data <- read_excel('man_height.xlsx')
#귀무 가설: 남자 키 평균은 175다
#대립 가설: 남자 키 평균은 175가 아니다
t <- (mean(data$키)-175)/(sd(data$키)/sqrt(length(data$키)))
tval <- qt(1- 0.05/2,29)
print(tval)                                 # 2.04523
if(abs(t) > tval) { 
  print("귀무가설 기각. 남자 평균 키는 175가 아니다")
} else {
  print("귀무가설 채택. 남자 평균 키는 175다") 
}

t.test(x=data, alternative = "two.sided", mu=175,conf.level = 0.95)
