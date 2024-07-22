install.packages("quantmod")
library(quantmod)
install.packages("forecast")
library(forecast)

#sin 함수 파형 예측
t = seq(0, 5, 0.01)
y = ts(sin(2 * pi * t) + t, frequency= 100)
plot(t,y, type='l')
plot(forecast(y, h=200))


#항공기 고객 수 예측
class(AirPassengers)

plot(x= c(1:144), y=AirPassengers, type="l")
plot(forecast(AirPassengers), h=200)

#삼성전가 종가 예측
data_pred = getSymbols('005930.KS',
                       from = '2021-01-01', to = '2021-09-01',
                       auto.assign = FALSE)
data_real = getSymbols('005930.KS',
                       from = '2021-01-01', to = '2021-10-30',
                       auto.assign = FALSE)

names(data_pred) <- c("open", "high", "low", "close", "volume", "adjusted")
names(data_real) <- c("open", "high", "low", "close", "volume", "adjusted")

data_pred <- rownames_to_column(as.data.frame(data_pred), var = 'date')
data_real <- rownames_to_column(as.data.frame(data_real), var = 'date')

data_pred$date <- as.Date(data_pred$date)
data_real$date <- as.Date(data_real$date)


pred_length <- length(data_real$close)-length(data_pred$close)

test <- forecast(data_pred$close, h=)
test <- as.data.frame(test)
length(test$`Point Forecast`)

data_real[,"pred_close"] <- c(data_pred$close, test$`Point Forecast`)
str(data_real)

datebreaks <- seq(as.Date("2021-01-01"), as.Date("2021-10-01"), by="1 month")
ggplot(data=data_real, aes(x=date)) +
  geom_line(aes(y=pred_close, col='red')) +
  geom_line(aes(y=close)) + 
  scale_x_date(breaks=datebreaks) +
  theme(axis.text.x = element_text(angle=30, hjust=1))
