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
dim(df)






































