#24차시 실습자료

#Q1
#엑셀 로딩 패키지 다운로드
install.packages("readxl")
library(readxl)


#데이터 로딩

#C열에 항공명, L열에 화물 실적 데이터 존재
data <- read_excel("airport.xlsx", col_names = FALSE, range="R80C3:R85C12") # 80행 C열부터 85행 L열까지의 데이터 로딩
head(data)

#데이터에서 ＇항공사별 화물 실적＇데이터를 추출
airportName <- data$...1  # 항공명
freight <- as.numeric(data$...10) # 화물 실적

# 추출한 데이터를 파이차트로 그림. (단, 항공사명, 비율 라벨 추가해야 함)
freight_percent<- freight / sum(freight) * 100
freight_percent <- round(freight_percent, digit=1) #round: 반올림 함수, 소숫점 1째자리에서 반올림
label_data <- paste(airportName, "(", freight_percent,"%", ")")
label_data
pie(freight, label=label_data)


#Q2
#데이터로딩
data <- read.csv("covid19.csv", header=F, skip=35, nrows=30) #header는 없으며, 앞의 35줄을 skip하고 그 다음부터 30줄을 로딩
dim(data)
data <- data[30:1,]                                          #데이터 위아래 뒤집기(reverse)

#9월 한달간 ＇당일 1차 접종자＇, '당일 2차 접종자‘ 데이터를 추출
#9월 한달간 ＇1차 접종률＇, ＇2차 접종률＇ 데이터를 추출

first_vaccine <- data$V3  #일일 1차 접종자 데이터 추출
second_vaccine <- data$V6 #일일 1차 접종자 데이터 추출
first_rate <- data$V5     # 1차 접종률 데이터 추출
second_rate <- data$V8     # 1차 접종률 데이터 추출

#화면분할 출력
par(mfrow = c(2,1))
plot(first_vaccine, type='o', col='red', pch=19, xlab="day", ylab="count", main="코로나 일일 백신 접종 수")
lines(second_vaccine, type='o', col='blue', pch=19)
legend("bottomright", legend=c('first', 'second'), fill=c("red", "blue"))

plot(first_rate, type='o', col='red', pch=19, xlab="day", ylab="rate(%)", ylim=c(20,80), main="총 백신 접종률 (%)")
lines(second_rate, type='o', col='blue', pch=19)
legend("bottomright", legend=c('first', 'second'), fill=c("red", "blue"))

#Q3

data <- read.csv('TravelMode.csv')
head(data)
dim(data)   # (840 10)
choice <- data$choice
choice_yes_index <- which(choice == "yes")
choice_yes_index
actual_data <- data[choice_yes_index,]  #choice값이 yes인 행과, 그 행들의 모든 열로 이루어진 데이터 프레임
head(actual_data)
processed_data <- actual_data[,c(-1, -2, -4)] # x, individual, choice 칼럼 제거
head(processed_data)
str(processed_data)        # 생성한 데이터셋 확인

#boxplot
boxplot_data <- processed_data[,c(-1, -4, -7)] #mode, travel, size 컬럼 제외
boxplot(boxplot_data)

#히스토그램
hist(processed_data$travel)

#파이차트
par(mfrow = c(1,2))
pie(table(processed_data$mode))
pie(table(processed_data$size))