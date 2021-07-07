######################################
##### 7장. 데이터 처리 성능 향상 #####
######################################
# 이 장의 내용 : plyr패키지(apply계열 함수 대치), 데이터 구조변경(melt, cast)
#                데이터테이블

### 1. plyr 패키지 ###
install.packages("plyr")
library(plyr)

apply(iris[, 1:4], 2, FUN = mean)
apply(iris[, 1:4], 2, FUN = function(col){mean(col)})

x <- data.frame(v1 = c(4, 9, 16),
                v2 = c(16, 81, 196))
apply(x, 2, sum)
apply(x, 2, FUN = function(col){sum(sqrt(col))})

? adply
adply(.data = x, .margins = 2, .fun = function(col){sum(sqrt(col))}) # a는 array, d는 dataframe
                                                                     # l은 list...

# 종별 Sepal.Length, Sepal.Width의 평균
library(doBy)
summaryBy(Sepal.Length + Sepal.Width ~ Species, data = iris, FUN = mean)

ddply(.data = iris, .(Species), function(group){
  data.frame(SL.mean = mean(group$Sepal.Length),
             SW.mean = mean(group$Sepal.Width))
})

# summarise 뒤에 명시된 변수만 출력된다.
# transform : 기존의 iris 변수 뒤에 명시된 변수가 추가되어 출력된다.
ddply(.data = iris, .(Species), summarise, SL.mean = mean(Sepal.Length),
                                           SW.mean = mean(Sepal.Width))


### 2. 데이터 구조 변경(melt, cast) ★★★ ###
head(airquality)

install.packages("reshape2")
library(reshape2)

## melt
airquality.melt <- melt(airquality, id = c('Month', 'Day'), value.name = "val")
head(airquality.melt)

# melt를 통해 바뀐 구조 확인 (5월 5일 데이터)
airquality.melt <- melt(airquality, id = c('Month', 'Day'), na.rm = T)

subset(airquality, Month == 5 & Day == 5)
subset(airquality.melt, Month == 5 & Day == 5)

## dcast, acast - melt 된 데이터 복구
airquality.dc <- dcast(airquality.melt, Month + Day ~ variable)
head(airquality.dc)
airquality.dc[airquality.dc$Month == 5 & airquality.dc$Day == 1, ]

airquality.ac <- acast(airquality.melt, Month + Day ~ variable)
head(airquality.ac)
airquality.ac['5_1', ] # 5월 1일 데이터

## 데이터 구조 변경 연습문제 ##
df1 <- read.csv("D:\\Gray_Bigdata\\Downloads\\14_sharedBigdata\\전국 평균 평당 분양가격(2013년 9월부터 2015년 8월까지).csv",
                header = T)
dim(df1)
table(is.na(df1))

df1.melt <- melt(df1, id = c('지역'), value.name = 'price')
head(df1.melt)

class(df1.melt$variable)
df1.melt$variable <- as.character(df1.melt$variable)

# variable에서 년도 뽑기
variable = 'X2013년12월'
substr(variable, 2, 5)

df1.melt$연도 <- as.integer(substr(df1.melt$variable, 2, 5))

# variable에서 월 뽑기
monthStr <- strsplit(variable, '년')[[1]][2]
monthStr <- substr(monthStr, 1, nchar(monthStr)-1)
as.integer(monthStr)

getMonth <- function(variable){
  monthStr <- strsplit(variable, '년')[[1]][2]
  monthStr <- substr(monthStr, 1, nchar(monthStr)-1)
  return(as.integer(monthStr))
}
getMonth('X2013년12월')
df1.melt$월 <- sapply(df1.melt$variable, getMonth)

df1.melt$variable <- NULL
head(df1.melt)
####################################################
df2 <- read.csv("D:\\Gray_Bigdata\\Downloads\\14_sharedBigdata\\주택도시보증공사_전국 신규 민간아파트 분양가격 동향_20210531.csv", header = T)

dim(df2)
head(df2)

df2 <- df2[df2$규모구분 == '모든면적', ]
df2$규모구분 <- NULL # 필요없는 변수 삭제

head(df2)
colnames(df2) <- c('지역', '연도', '월', 'price_per_m')
df2[df2$price_per_m == '', ] # 빈칸 찾기
colSums(is.na(df2))

df2$price_per_m <- as.integer(df2$price_per_m)
sum(is.na(df2)) # 빈칸 등 정수형으로 변환할 수 없는 것은 NA로 처리

df2$price <- df2$price_per_m * 3.3
#####################################################
head(df1.melt, 2)
head(df2[, c('지역', '연도', '월', 'price')], 2)

df <- rbind(df1.melt, df2[, c('지역', '연도', '월', 'price')])


### 3. 데이터 테이블 ###
# 짧고 유연한 빠른 구문을 사용하기 위해 데이터프레임에서 상속받음
flightDF <- read.csv("inData/flights14.csv", header = T)
head(flightDF)

install.packages("data.table")
library(data.table)

flight <- fread('inData/flights14.csv') # csv파일을 데이터테이블로 받는 함수
class(flight)


## 연습예제 ##
# 1. origin이 JFK이고 month가 5월인 모든 행을 resul에 얻는다
resul <- flightDF[flight$origin == 'JFK' & flightDF$month == 5, ]
resul <- subset(flightDF, origin == 'JFK' & flight$month == 5)

flight <- flight[origin == 'JFK' & month == 5]

# 2. 처음 두 행을 resul에 얻는다
resul <- head(flightDF, 2)
resul <- flight[1:2]

# 3. origin으로 오름차순, dest로 내림차순으로 정렬하여 출력
library(dplyr)
flightDF.order <- flightDF[order(flightDF$origin, desc(flightDF$dest)), ]
flightDF.order

flight[order(flight$origin, -flight$dest)]
flight[order(origin, -dest)]

# 4. arr_delay열만 출력
flightDF[, 'arr_delay'] # 벡터 형태
flightDF[, 'arr_delay', drop = F] # 데이터프레임 형태
flight[, c('arr_delay')] # 데이터 프레임 형태
flight[, .(arr_delay)] # 데이터프레임(데이터테이블) 형태

# 5. year열부터 dep_time열까지 출력
flightDF[, 1:4]
subset(flightDF, select = 1:4)

flight[, year:dep_time]
subset(flight, select = c(year : dep_time))

# 6. year열과 dep_time열 출력
flightDF[, c('year', 'dep_time')]
subset(flightDF, select = c('year', 'dep_time'))

flight[, .(year, dep_time)]
flight[, .(연도 = year, 출발시간 = dep_time)] # 출력되는 header(변수) 변경

# 7. arr_delay열과 dep_delay열을 출력하되 열이름을 delay_arr과 delay_dep로 변경
flightDF %>% select('arr_delay', 'dep_delay') %>% rename(delay_arr = arr_delay, 
                                                         delay_dep = dep_delay)

flight[, .(delay_arr = arr_delay, delay_dep = dep_delay)]

# 8. 지연시간(arr_delay, dep_delay)이 모두 0미만인 비행이 몇 번인지 출력
flightDF %>% filter(arr_delay <0 & dep_delay <0) %>% select(flight) %>% summarise(n = n())
nrow(flightDF[flightDF$arr_delay < 0 & flightDF$dep_delay <0, ])

flight[arr_delay < 0 & dep_delay < 0, .(cnt = .N)] # .N : 갯수

#   8-1 지연시간의 합이 0미만인 비행이 몇 번인지 출력
flightDF %>% filter((arr_delay + dep_delay) < 0) %>% select(flight) %>% summarise(n = n())
nrow(flightDF[(flight$arr_delay + flightDF$dep_delay) < 0, ])

flight[(arr_delay + dep_delay) < 0, .(.N)]

# 9. 6월에 출발 공항이 JFK인 모든 항공편의 도착지연 및 출발지연 시간의 평균을 계산
flightDF %>% filter(month == 6 & origin == 'JFK') %>% mutate(arr_avg = mean(arr_delay),
                                                             dep_avg = mean(dep_delay)) %>% head()
apply(flightDF[flightDF$origin == 'JFK' & flightDF$month == 6, c('arr_delay', 'dep_delay')], 2, mean)

flight[origin == 'JFK' & month == 6, .(mean(arr_delay), mean(dep_delay))]


# 10. 9번의 결과에 title에 mean_arr, mean_dep로 출력
flightDF %>% filter(month == 6 & origin == 'JFK') %>% mutate(mean_arr = mean(arr_delay),
                                                             mean_dep = mean(dep_delay)) %>% head()
x <- apply(subset(flightDF, origin == 'JFK' & month == 6, select = c('arr_delay', 'dep_delay')), 2, mean)

names(x) <- c('mean_arr', 'mean_dep')
x

flight[origin == 'JFK' & month == 6, .(mean_arr = mean(arr_delay),
                                       mean_dep = mean(dep_delay))]

# 11. JFK 공항의 6월 운항 횟수
nrow(subset(flightDF, origin == 'JFK' & month == 6))

flight[origin == 'JFK' & month == 6, .N]

# 12. JFK 공항의 6월 운항 데이터 중 arr_delay열과 dep_delay열을 출력
subset(flightDF, subset = (origin == 'JFK' & month == 6), select = c('arr_delay', 'dep_delay'))

flight[origin == 'JFK' & month == 6, .(arr_delay, dep_delay)]
flight[origin == 'JFK' & month == 6, list(arr_delay, dep_delay)]

# 13. JFK 공항의 6월 운항 데이터 중 arr_delay열과 dep_delay열을 제외한 모든 열 출력
flightDF %>% filter(month == 6 & origin == 'JFK') %>% select(-c('arr_delay', 'dep_delay')) %>% head()
colnames(flightDF)
subset(flightDF, origin == 'JFK' & month == 6, select = c(-5, -7))

flight[origin == 'JFK' & month == 6, -c("arr_delay", "dep_delay")]

# 14. 출발 공항(origin)별 비행 수 출력 (JFK 81483 LGA 84433 EWR 87400)
table(flightDF$origin)

flight[, .N, by = .(origin)]

# 15. 항공사코드(carrier)가 AA에 대해 출발공항별 비행횟수 계산
table(subset(flightDF, subset = (carrier == 'AA'), select = 'origin'))

flight[carrier == 'AA', .N, by = .(origin)]

# 16. origin, dest별로 비행횟수 출력
table(flightDF$origin, flightDF$dest)

flight[, .(.N), by = .(origin, dest)]

# 17. 항공사코드(carrier)가 AA에 대해 origin, dest별로 비행횟수 출력
table(subset(flightDF, subset = (carrier == 'AA'), select = c('origin', 'dest')))

flight[carrier == 'AA', .(.N), by = .(origin, dest)]

# 18. 항공사 코드가 AA에 대해, origin, dest, 월별 평균arr_delay, 평균 dep_delay 출력
flightDF %>% filter(carrier == 'AA') %>% select('origin','dest') %>% mutate(mean_arr = mean(arr_delay),
                                                                            mean_dep = mean(dep_delay))
temp <- flightDF[flightDF$carrier == 'AA', ]
aggregate(temp[, c('arr_delay', 'dep_delay')],
          by = list(temp$origin, temp$dest, temp$month),
          FUN = mean)

flight[carrier == 'AA', .(mean(arr_delay), mean(dep_delay)), by = .(origin, dest, month)]

# 19. dep_delay>0가 참이거나 거짓, arr_delay>0가 참이거나 거짓인 각각의 비행횟수
table(flightDF$dep_delay > 0, flightDF$arr_delay > 0)

flight[, .(.N), by = .(dep_delay > 0, arr_delay > 0)]

# 20. Origin==“JFK”에 대해 월별 최대 출발 지연 시간 출력(month로 정렬)
flightDF %>% filter(origin == 'JFK') %>% arrange(desc(month)) %>% select(dep_delay) %>% head(1)
temp <- subset(flightDF, origin == 'JFK')

tapply(temp$dep_delay, temp$month, max)
aggregate(temp$dep_delay, by = list(temp$month), max)

result <- aggregate(temp$dep_delay, by = list(temp$month), max)
result
result[order(result$Group.1), ]

library(doBy)
result <- summaryBy(dep_delay ~ month, data = temp, FUN = max)
result[order(result$month), ]

flight[origin == 'JFK', .(max = max(dep_delay)), by = .(month)]