#40차시 실습자료
library(psych)



#Q1-1
myload_data <- function(path){
  data <- read.table(path, header=T, sep=';')
  
  for (col in names(data)){
    data[,col] <- as.numeric(data[, col])
  
  }
  return(data)
}

red_wine <- myload_data('winequality-red.csv')
white_wine <- myload_data('winequality-white.csv')
#---------- Q1-1 끝

#Q1-2
library(corrplot)

mydraw_correlation <- function(data, cor_method="pearson"){
  M <- cor(data, method=cor_method)
  names(M) <- names(data)  #데이터 상관관계값 추출하면 컬럼 이름명 사라짐. 재할당
  col <- colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA"))
  corrplot(M,
           method = "color",
           col = col(150),
           type = "upper",
           order = "hclust",
           number.cex = .7,
           addCoef.col = "black",
           tl.col = "black",
           tl.srt = 90,
           sig.level = 0.01,
           insig = "blank",
           diag = FALSE)
}
#피어슨 상관관계 비교
mydraw_correlation(white_wine)
mydraw_correlation(red_wine)
#피어스만 상관관계 비교
mydraw_correlation(white_wine, "spearman")
mydraw_correlation(red_wine, "spearman")

#--------------------------Q1-2 끝

#Q1-3
# 시각화 해서 상관관계 확인하기
pairs(red_wine)
pairs(white_wine)


#---------------Q1-3 끝

#Q1-4
library(ggplot2)

# 알코올과 품질의 상관관계만 시각화하기
qplot(data=red_wine, x=quality, y=alcohol, geom='point')
qplot(data=white_wine, x=quality, y=alcohol, geom='point')

#------------Q1-4 끝

#Q1-5
# boxplot으로 확인하기
ggplot(red_wine, aes(y=alcohol)) +
  geom_boxplot(aes(col=factor(quality)))
ggplot(white_wine, aes(y=alcohol)) +
  geom_boxplot(aes(col=factor(quality)))

#----------Q1-5 끝

#alcohol과 상관계수 높은 density 에 따른 quality보기
ggplot(data=red_wine) +
  geom_point(aes(x=alcohol, y=density, col=factor(quality)))
ggplot(data=white_wine) +
  geom_point(aes(x=alcohol, y=density, col=factor(quality)))



#------------------------------
#---------------------------------
#레드와인의 평균 도수는 12~15도


#Q2-1
shapiro.test(red_wine$alcohol)
shapiro.test(white_wine$alcohol)

#Q2-2
ggplot(red_wine) +
  geom_histogram(aes(x=alcohol, fill=factor(quality)))

#Q2-3
library(dplyr)
high_quality_white <- white_wine %>% filter(quality > 6)
shapiro.test(high_quality_white$alcohol)

high_quality_red <- red_wine %>% filter(quality > 6)
shapiro.test(high_quality_red$alcohol)

#Q2-4
red_wine %>% filter(quality > 6) %>% ggplot() +
  geom_density(aes(x=alcohol), col='red') +     #전체 레드와인 알코올 분포
  geom_density(data=red_wine, aes(x=alcohol))   #고품질 레드와인 알코올 분포

#Q2-5
# t검정
t.test(x=high_quality_red$alcohol, alternative = "two.sided", mu=11.5, conf.level = 0.95)
