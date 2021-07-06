#####################################################
##### 5-1장 dplyr 패키지를 이용한 데이터 전처리 #####
#####################################################
################################
### 1. 외부파일 read / write ###
################################
## 1.1 엑셀파일 읽어오기 ##
# readxl 패키지 이용
install.packages("readxl")
library(readxl)
getwd()
exam <- read_excel("D:/Gray_Bigdata/src/06_R/inData/exam.xlsx") # 첫번째 sheet의 값을 read
exam <- read_excel("D:\\Gray_Bigdata\\src\\06_R\\inData\\exam.xlsx")
exam <- read_excel('inData/exam.xlsx')

exam <- as.data.frame(exam)
class(exam)
head(exam)

exam2 <- as.data.frame(read_excel('inData/exam.xlsx', sheet = 2))
class(exam2)
exam2

# 데이터 파일에 컬럼명이 없는 경우
A <- read_excel('inData/data_ex.xls', col_names = F)
A <- as.data.frame(A)
head(A, 3)
colnames(A) <- c('id', 'gender', 'age', 'loc')

## 1-2. 데이터 쓰기 ##
# csv파일로 쓰기, 변수로 쓰기
.libPaths()

write.csv(exam, 'outData/exam.csv', row.names = T)
write.csv(exam, 'outData/exam.csv', row.names = F)

# exam 변수를 파일에 저장
save(exam, file = 'outData/exam.rda')

rm(list = ls(all.names = T)) # 히든 변수까지 삭제

load('outData/exam.rda')


######################################################
### 2. dplyr 패키지 이용을 위한 데이터 준비 및 파악###
######################################################
### 2-1. 데이터 준비 ###
data(mpg, package = "ggplot2")
mpg <- as.data.frame(ggplot2::mpg)
class(mpg)

midwest <- as.data.frame(ggplot2::midwest)
midwest

### 2-2. 데이터 파악 ###
dim(mpg) # 확인용
str(mpg)
summary(mpg)
edit(mpg)
View(mpg)

head(mpg) # 간단히 데이터 파악
tail(mpg, 1)

# 변수명(열 이름)
# ex) cty <- city, hwy <- highway
library(dplyr)
mpg <- rename(mpg, c(city = cty, highway = hwy))
colnames(mpg)

# 파생변수
# (total = (city + highway) / 2)
mpg$total <- (mpg$city + mpg$highway) / 2
head(mpg, 3)

# total 연비가 평균보다 높으면 pass, 낮으면 fail
# boxplot : 1,2,3사분위수, 이상치
boxplot(mpg$total)
# histogram : 연속된 수의 빈도를 확인
hist(mpg$total) 
# vioplot
library(vioplot)
vioplot(mpg$total)

mpg$test <- ifelse(mpg$total >= mean(mpg$total), 'PASS', 'FAIL')
table(mpg$test) # 빈도표 (결측치 미포함)

library(ggplot2)
head(mpg)
dev.off() # qplot이 에러날 때
qplot(mpg$test)

# 연습문1. ggplot2의 midwest 데이터를 데이터 프레임의 형태로 불러와서
#          데이터의 특성을 파악하세요.
midwest <- as.data.frame(ggplot2::midwest)

class(midwest)
dim(midwest)
table(is.na(midwest)) # 결측치 갯수 파악

head(midwest, 2)
View(head(midwest, 3))
tail(midwest, 3)

colnames(midwest) # 열(col) 이름 출력
rownames(midwest) # 행(row) 이름 출력

colSums(is.na(midwest)) # 열(col)별 결측치 갯수

# 연습문2. poptotal(전체 인구)을 total로, popasian(아시아 인구)을 asian으로
#          변수명을 변경하세요.
? midwest
midwest <- rename(midwest, c(total = poptotal, asian = popasian))
names(midwest)

# 연습문3. total, asian 변수를 이용해 '전체 인구 대비 아시아 인구 백분율' 파생
#          변수를 만들고, 히스토그램을 만들어 도시들이 어떻게 분포하는지 살펴
#          보세요.
midwest$retioasian <- (midwest$asian / midwest$total) * 100 # 아시아 인구 백분율

head(midwest[, c('state', 'total', 'asian', 'retioasian')])

? hist
hist(midwest$retioasian)

# 연습문4. 아시아 인구 백분율 전체 평균을 구하고, 평균을 초과하면 "large", 그 외
#          에는 "small"을 부여하는 파생변수를 만들어보세요.
midwest$group <- ifelse(midwest$retioasian > mean(midwest$retioasian), "large", "small")
? ifelse

head(midwest$group, 10)

# 연습문5. 빈도표, 빈도그래프(히스토그램-연속변수, 막대그래프-카테고리컬변수)
table(midwest$group)
dev.off()
qplot(midwest$group, fill = midwest$group)

### 2-3. dplyr 패키지를 이용하여 전처리 및 분석하기 ###
# filter() - 조건에 맞는 데이터 추출하는 기능 '%>%'(Ctrl + Shift + m)

# ex1. class가 1인 행만 추출
exam <- read.csv('inData/exam.csv', header = T)
library(dplyr)

? filter
exam %>% filter(class == 1)
subset(exam, class == 1)
exam[exam$class == 1, ]

# ex2. class가 1이거나 2이거나 3인 데이터 추출
exam %>% filter(
  class == 1 | class == 2 | class == 3
)

exam %>% filter(
  class %in% c(1, 2, 3)
)

# ex3. class가 1이거나 2이고, Eng가 80이상인 데이터 추출
exam %>% filter(
  class %in% c(1,2) & english >= 80
)

# select() - 필요한 변수 추출
? select
exam %>% select(
  class, english, math # 추출하고자 하는변수만 
)

subset(exam, select = c('class', 'english', 'math'))

exam %>% select(
  -math # math변수만 제외하고 전부 출력
)

# ex1. class가 1이거나 2인 행에서 영어, 수학 데이터만 출력
exam %>% filter(
  class %in% c(1, 2)) %>%
  select(english, math)

exam %>% filter(
  class %in% c(1, 2)) %>%
  select(3, 4)

# ex2. class가 1이거나 2인 행에서, 수학(3번째 열), 영어(4번째 열), 과학(5번째 열)
#      데이터만 출력하시오.
exam %>% filter(
  class %in% c(1, 2)) %>% 
  select(math, english, science)

# ex3. class가 1,2,3인 행에서 영어, 수학 데이터를 앞 5개만 추출하시오.
exam %>% filter(
  class %in% c(1, 2, 3)) %>% select(
    english, math) %>% head(5)

# arrange() - 정렬
exam %>% arrange(math) # math기준으로 오름차순 정렬
exam %>% arrange(desc(math)) # math 기준으로 내림차순 정렬
exam %>% arrange(-math)
exam %>% arrange(class, desc(math)) # class 오름차순, math 내림차순
exam %>% arrange(class, -math)

# ex1. ID가 1부터 10인 학생의 영어, 수학성적을 영어성적 기준으로 오름차순 정렬하 
#      여 상위 6개의 데이터만 출력하시오.
exam %>% filter(
  id %in% c(1:10)) %>% select(
    english, math) %>% arrange(english) %>% head

# mutate() - 파생변수 추가
# 실제 데이터에서 수정이 일어나지는 않는다.
exam %>% mutate(
  total = math + english + science) %>% arrange(total) %>% head()

exam %>% mutate( # 한번에 두개 이상 파생변수를 추가해서 분석이 가능하다
  total = math + english + science, avg = round(math + english + science),
  group = ifelse(total > 180, 'A', 'B')) %>% head()

# summarise() - 통계치 함수를 넣을 수 있다
# 통계치 함수 : mean, sd, min, max, median, n(갯수)
apply(exam[, 1:4], 2, mean)

? summarise
exam %>% summarise(mean_math = mean(math))
exam %>% summarise(mean_math = mean(math),
                   sd_math = sd(math),
                   mean_eng = mean(english),
                   sd_eng = sd(english),
                   cnt = n()
                   )

# group by() - 집단 별 요약, summarise()와 같이 사용한다
exam %>% group_by(
  class) %>% summarise(mean_math = mean(math),
                       sd_math = sd(math),
                       mean_eng = mean(english),
                       sd_eng = sd(english)
                       )

# ex1. summaryBy를 사용하여 위의 식과 동일하게 만들어보기
library(doBy)
result1 <- summaryBy(math + english ~ class, data = exam, FUN = c(mean, sd))

result2 <- table(exam$class)
result2 <- data.frame(result2)
names(result2) <- c('class', 'cnt')

merge(result1, result2)

head(mpg)
# mpg데이터에서 회사별로 "suv 자동차의 도시와 고속도로 통합 연비 평균을 구해 내
# 림차순으로 정렬하고 1~5위까지 출력하기
class(mpg)
head(mpg)
table(mpg$class)

# 방법 1
mpg %>% filter(
  class == 'suv') %>% group_by(
    manufacturer) %>% mutate(
      total = round((city + highway)/2)) %>% summarise(
        tot_mean = mean(total)) %>% arrange(desc(tot_mean)) %>% head(5)

# 방법 2
df <- mpg[mpg$class == 'suv', ]
df$total <- (df$city + df$highway) / 2
head(sort(tapply(df$total, df$manufacturer, mean)), 5)

##############################
### 혼자 풀어보는 연습문제 ###
##############################
# 문1.
# Q1)자동차 배기량에 따라 고속도로 연비가 다른지 알아보려고 합니다. displ(배기량)이
#    4이하인 자동차와 5 이상인 자동차 중 어떤 자동차의 hwy(고속도로 연비)가
#    평균적으로 더 높은지 알아보세요.
mpg %>% filter(
  displ <= 4 | displ >= 5) %>% mutate(group = ifelse(displ <= 4, '배기량 4이하',
                                                     ifelse(displ >= 5, '배기량 5이상', NA))) %>%
  group_by(group) %>% summarise(mean_total = mean(highway))

df <- mpg
df$group <- ifelse(df$displ <= 4, "배기량 4이하", ifelse(df$displ >= 5, "배기량 5이상", NA))
table(df$group, useNA = 'ifany') # useNA = 'ifany'를 추가시 결측치까지 반영됨

tapply(df$highway, df$group, mean)
by(df$highway, df$group, mean) # 다수의 열일때는 mean은 안되고 summary, sum 등이 됨
summaryBy(highway ~ group, df, FUN = mean) # 여러개의 열과 여러개의 함수 가능(NA까지)
aggregate(df$highway, by = list(df$group), mean)

# Q2) 자동차 제조 회사에 따라 도시 연비가 다른지 알아보려고 합니다. "audi"와 "toyota"
#     중 어느 manufacturer(자동차 제조 회사)의 cty(도시 연비)가 평균적으로 더 높은지
#     알아보세요.
mpg %>% filter(
  manufacturer %in% c("audi", "toyota")) %>% group_by(
    manufacturer) %>% summarise(mean_city = mean(city))

A <- subset(mpg, mpg$manufacturer == 'audi', select = c('manufacturer','city'))
B <- subset(mpg, mpg$manufacturer == 'toyota', select = c('manufacturer','city'))

Audi.city <- mean(A$city)
Toyota.city <- mean(B$city)

rbind(Audi.city, Toyota.city)

# Q3) "chevrolet", "ford","honda" 자동차의 고속도로 연비 평균을 알아보려고 합니다.
#     이 회사들의 자동차를 추출한 뒤 hwy 전체 평균을 구해보세요.
mpg %>% filter(
  manufacturer == c('chevrolet', 'ford', 'honda')) %>% group_by(manufacturer) %>% 
  summarise(highway_avg = round(mean(highway)))


# 문2
# Q1) mpg 데이터는 13개 변수로 구성되어 있습니다. 이 중 일부만 추출해서 분석에
#     활용하려고 합니다. mpg 데이터에서 class(자동차 종류), cty(도시 연비) 변수를
#     추출해 새로운 데이터를 만드세요. 새로 만든 데이터의 일부를 출력해서 
#     두 변수로만 구성되어 있는지 확인하세요.
new_data <- mpg %>% select(class, city)

# Q2) 자동차 종류에 따라 도시 연비가 다른지 알아보려고 합니다. 앞에서 추출한 데이터를
#     이용해서 class(자동차 종류)가 "suv"인 자동차와 "compact"인 자동차 중 어떤 자동차의
#     cty(도시 연비)가 더 높은지 알아보세요.
new_data %>% filter(
  class %in% c('suv', 'compact')) %>% group_by(class) %>% summarise(city_cost = mean(city))

new_data <- new_data[new_data$class %in% c('suv', 'compact')]

# Q3) "audi"에서 생산한 자동차 중에 어떤 자동차 모델의 hwy(고속도로 연비)가 높은지
#     알아보려고 합니다. "audi"에서 생산한 자동차 중 hwy가 1~5위에 해당하는 자동차의
#     데이터를 출력하세요.
mpg %>% filter(
  manufacturer == 'audi') %>% arrange(desc(highway)) %>% head(5)

head(orderBy(~ -highway, mpg[mpg$manufacturer == 'audi', ]), 5)


# 문3
# mpg 데이터는 연비를 나타내는 변수가 hwy(고속도로 연비), cty(도시 연비) 두 종류
# 로 분리되어 있습니다. 두 변수를 각각 활용하는 대신 하나의 통합 연비 변수를 만들어
# 분석하려고 합니다.
# Q1) mpg 데이터 복사본을 만들고, cty와 hwy를 더한 '합산 연비 변수'를 추가하세요.
df <- mpg %>% mutate(total = city + highway)

df$total <- df$city + df$highway

# Q2) 앞에서 만든 '합산 연비 변수'를 2로 나눠 '평균 연비 변수'를 추가세요.
df$avg <- round(df$total / 2)

# Q3) '평균 연비 변수'가 가장 높은 자동차 3종의 데이터를 출력하세요.
df %>% mutate(avg = (city + highway) /2) %>% 
  arrange(desc(avg)) %>% head(3)

# Q4) 1~3번 문제를 해결할 수 있는 하나로 연결된 dplyr 구문을 만들어
#     출력하세요. 데이터는 복사본 대신 mpg 원본을 이용하세요.
mpg %>% mutate(total_x = city + highway,
                                   avg_x = round((city + highway) / 2)) %>%
  arrange(desc(avg_x)) %>% head(3)


# 문4
# Q1) mpg 데이터의 class는 "suv", "compact" 등 자동차를 특징에 따라 일곱 종류로
#     분류한 변수입니다. 어떤 차종의 연비가 높은지 비교해보려고 합니다. class별
#     city 평균을 구해보세요
table(mpg$class)
mpg %>% group_by(class) %>% summarise(city_avg = mean(city))

sort(tapply(mpg$city, mpg$class, mean))

# Q2) 앞 문제의 출력 결과는 class 값 알파벳 순으로 정렬되어 있습니다. 어떤 차종의
#     도시 연비가 높은지 쉽게 알아볼 수 있도록 city 평균이 높은 순으로 정렬해 출력하세요.
mpg %>% group_by(class) %>% summarise(city_avg = mean(city)) %>% arrange(desc(city_avg))

result <- aggregate(mpg$highway, by = list(mpg$manufacturer), mean)

# Q3) 어떤 회사 자동차의 hwy(고속도로 연비)가 가장 높은지 알아보려고 합니다.
#     hwy 평균이 가장 높은 회사 세 곳을 출력하세요.
mpg %>% group_by(manufacturer) %>% summarise(highway_avg = mean(highway)) %>% 
  arrange(desc(highway_avg)) %>% head(3)

result[order(-result$x), ][1:3, ]

# Q4) 어떤 회사에서 "compact"(경차) 차종을 가장 많이 생산하는지 알아보려고
#     합니다. 각 회사별 "compact" 차종 수를 내림차순으로 정렬해 출력하세요
mpg %>% filter(
  class == 'compact') %>% group_by(manufacturer) %>% summarise(cnt = n()) %>%
  arrange(desc(cnt))

sort(table(mpg[mpg$class == 'compact', ]$manufacturer), decreasing = T)


### 2-4 데이터 합치기 ###
detach("package:dplyr", unload = T)
library(dplyr)

# 열 합치기 : cbind, left_join (dplyr 패키지 함수)
test1 <- data.frame(id = c(1, 2, 3, 4, 5), midterm = c(100, 90, 80, 70, 60))
test2 <- data.frame(id = c(1, 2, 3, 4, 5), final = c(99, 88, 77, 66, 55), t_id = c(1, 1, 2, 2, 4))

teacher <- data.frame(t_id = c(1,2,3),
                      t_name = c('Kim', 'Park', 'Bae'))

cbind(test1, test2) # 공통된 열이 중복생성 되어 좋지 않다.

merge(test1, test2) # 특정 열을 key로 삼아 병합한다.
left_join(test1, test2, by = 'id')

cbind(test2, teacher) # 행수가 맞지 않아 에러 발생

merge(test2, teacher, by = 't_id') # 결측치는 보이지 않음.
left_join(test2, teacher, by = 't_id')

merge(test2, teacher, by = 't_id', all = T) # 없는 데이터는 NA로 출력

# 행 합치기 : rbind, bind_rows (dplyr 패키지 함수)
group.a <- data.frame(id = c(1, 2, 3, 4, 5), test1 = c(100, 90, 80, 70, 60))
group.b <- data.frame(id = c(6, 7, 8, 9, 10), test2 = c(50, 55, 60, 65, 100))

rbind(group.a, group.b) # 두 데이터 프레임의 변수가 같을 경우 다르면 에러 발생
bind_rows(group.a, group.b)
merge(group.a, group.b, all = T) # all = T : 공통되지 않은 것 까지 출력해라


##############################
### 혼자 풀어보는 연습문제 ###
##############################
fuel <- data.frame(fl = c('c', 'd', 'e', 'p', 'r'),
                   kind = c('CNG', 'diesel', 'ethanol E85', 'premium', 'regular'),
                   price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22))
# Q1) mpg에 price fl 변수 추가하기
mpg <- left_join(mpg, fuel[, c('fl', 'price_fl')], by = 'fl')
mpg <- merge(mpg, fuel[, c('fl', 'price_fl')], by = 'fl')
head(mpg)

# Q2) 연료가격(price_fl)변수가 잘 추가되었는지 확인을 위해, model, fl, price_fl을 추출해
#     앞 5행을 출력하기
mpg %>% select(
  model, fl, price_fl) %>% head(5) # 방법1
mpg[1:5, c('model', 'fl', 'price_fl')] # 방법2
subset(mpg, select = c('model', 'fl', 'price_fl'))[1:5, ] #방법3
head(subset(mpg, select = c('model', 'fl', 'price_fl')), 5)

# Q3) mpg에 kind변수 추가하기
mpg <- left_join(mpg, fuel[, c('fl', 'kind')], by = 'fl') # 공통 부분인 fl과 추가 할 변수를
                                                          # 선택해 merge하면 된다.

data(mpg, package = "ggplot2")
names(mpg)

# left_join을 쓰지 않고 apply를 이용하여 kind를 추가
fuel[fuel$fl == 'p', 'kind']

flToKind <- function(fl){
  kind <- fuel[fuel$fl == fl, 'kind']
  return(kind)
}

flToKind('r')
mpg$kind <- apply(mpg[, 'fl', drop = F], 1, flToKind)
head(mpg)


### 2-5 데이터 정제하기 (결측치, 이상치) ###
## 결측치 정제하기 ##
df <- data.frame(name = c('Kim', 'Yi', 'Yun', 'Ma', 'Park'),
                 gender = c('M', 'F', NA, 'M', 'F'),
                 score = c(5, 4, 3, 4, NA),
                 income = c(2000, 3000, 4000, 5000, 6000))
df$gender <- as.factor(df$gender)

dim(df) # n행 m열 출력
is.na(df) # 결측치 여부를 n행 m열로 출력력

df

colSums(is.na(df)) # 데이터 프레임을 열 별로 합침 = 열 별 결측치 갯수
na.omit(df) # 결측치가 있는 행 자체 전부 제거, 간편하다.
            # 다른 열 기준으로 데이터를 추려낼 때 분석에 오류가 생긴다.

# 결측치를 대체
library(dplyr)
df %>% filter(
  !is.na(score)) %>% summarise(mean_score = mean(score))

# 결측치를 대체(2) - 중앙값, 평균값
x <- c(1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 100)

mean(x)
median(x)

exam <- read.csv('inData/exam.csv', header = T)
exam[c(3, 8, 15), 'math'] <- NA # math의 3,8,15행 값을 NA로 바꿈
exam[1:2, 'english'] <- NA
exam[1, 'science'] <- NA
table(is.na(exam))
colSums(is.na(exam)) # (1) 열 별 결측치를 확인

colSums(is.na(exam))
median(exam$math, na.rm = T) # (2) math 열의 결측치를 대체 할 값
exam$math <- ifelse(is.na(exam$math), median(exam$math, na.rm = T), exam$math)
exam$english <- ifelse(is.na(exam$english), median(exam$english, na.rm = T), exam$english)
# exam$english에 NA가 있으면, english$median의 NA를 median으로 대체하고 아니면, 그냥 exam$english 값으로 둬라

colSums(is.na(exam))
table(is.na(exam))

m <- apply(exam[, 3:5], 2, median, na.rm = T) # exam의 3~5열의 모든 행의 중앙값
m

# 결측치 처리 방법1. within
exam <- within(exam, { # 결측치 대체를 위한 블록
  math <- ifelse(is.na(math), m['math'], math) # math에 NA가 있다면 math의 중앙값으로 대체
  english <- ifelse(is.na(english), m['english'], english)
  science <- ifelse(is.na(science), m['science'], science)
})

colSums(is.na(exam))

# 결측치 처리 방법2. mutate
library(dplyr)
exam <- exam %>% mutate(
  math = ifelse(is.na(math), m['math'], math),
  english = ifelse(is.na(english), m['english'], english),
  science = ifelse(is.na(science), m['science'], science)
)
colSums(is.na(exam))
table(is.na(exam))

## 이상치 정제하기 ##
# 1) 논리적인 이상치 (ex. 성별에 남,여가 아닌 값이 들어왔을 때)
outlier <- data.frame(gender = c(1, 2, 1, 3, 2),
                      score = c(90, 95, 100, 99, 101)
                      )
outlier
# 방법1 - 이상치는 결측치로 대체
outlier$gender <- ifelse(outlier$gender != 1 & outlier$gender != 2, NA, outlier$gender)

# 방법2
outlier$gender <- factor(outlier$gender, levels = c(1, 2), labels = c('남', '여'))
table(outlier$gender)

outlier$score <- ifelse(outlier$score > 100, NA, outlier$score)

# 2) 극단적인 이상치 (정상적인 기준에서 많이 벗어난 값, 상′하위 0.3% 또는
#                     평균 - (2.5 * 표준편차) ~ 평균 + (2.75 * 표준편차))
mpg <- as.data.frame(ggplot2::mpg)
sort(mpg$hwy)
lowlimit <- mean(mpg$hwy) - (2.75 * sd(mpg$hwy))
highlimit <- mean(mpg$hwy) + (2.75 * sd(mpg$hwy))

lowlimit
highlimit

mpg$hwy[mpg$hwy > highlimit] # 상향 극단치보다 큰 값
mpg$hwy[mpg$hwy < lowlimit] # 하향 극단치보다 작은 값

# boxplot을 이용한 이상치 확인
result <- boxplot(mpg$hwy)$stats
result[1]
result[5]

mpg$hwy[mpg$hwy > result[5]] # 상향 극단치보다 큰 값
mpg$hwy[mpg$hwy < result[1]] # 하향 극단치보다 작은 값

# 이상치를 결측치로 대체
mpg$hwy <- ifelse(mpg$hwy > result[5] | mpg$hwy < result[1], NA, mpg$hwy)
sum(is.na(mpg$hwy)) # mpg$hwy에 NA가 있냐? 있으면 그거 몇개인지 세어봐

rm(list = ls())

##############################
### 혼자 풀어보는 연습문제 ###
##############################
data(mpg, package = "ggplot2") # mpg 데이터 불러오기
mpg[c(10, 14, 58, 93), "drv"] <- "k" # drv에 이상치 할당
mpg[c(29, 43, 129, 203), "cty"] <- c(3, 4, 39, 42) # cty에 이상치 할당

# Q1) drv에 이상치가 있는지 확인하세요. 이상치를 결측 처리한 다음 이상치가 
#     사라졌는지 확인하세요. 결측 처리 할 때는 %in% 기호를 활용하세요.
sort(mpg$drv)
table(mpg$drv)
table(mpg$drv, useNA = "ifany")

mpg$drv <- ifelse(! mpg$drv %in% c(4, 'f', 'r'), NA, mpg$drv)

# Q2) 상자 그림을 이용해서 cty에 이상치가 있는지 확인하세요. 상자 그림의 통계치를
#     이용해 정상 범위를 벗어난 값을 결측 처리한 후 다시 상자 그림을 만들어 이상치가
#     사라졌는지 확인하세요
sort(mpg$cty)

result <- boxplot(mpg$cty)$stats

mpg$cty[mpg$cty > result[5]]
mpg$cty[mpg$cty < result[1]] 

mpg$cty <- ifelse(mpg$cty > result[5] | mpg$cty < result[1], NA, mpg$cty)
table(mpg$cty, useNA = "ifany")

# Q3) 두 변수의 이상치를 결측처리 했으니 이제 분석할 차례입니다. 이상치를 제외한 다음
#     drv별로 cty 평균이 어떻게 다른지 알아보세요. 하나의 dplyr 구문으로 만들어보세요.
drv_avg <- mpg %>% group_by(drv) %>% summarise(drv_cty = mean(cty, na.rm = T)) %>%
  filter(!is.na(drv))
drv_avg


##############################
### 혼자 풀어보는 분석도전 ###
##############################
data(midwest, package = "ggplot2") # midwest 데이터 불러오기

# 문1. popadults는 해당 지역의 성인 인구, poptotal은 전체 인구를 나타냅니다.
#      midwest 데이터에 '전체 인구 대비 미성년 인구 백분율' 변수를 추가하세요.
midwest$popyouth <- (midwest$poptotal-midwest$popadults) / midwest$poptotal * 100
View(midwest)

# 문2. 미성년 인구 백분율이 가장 높은 상위 5개 county(지역)의 미성년 인구백분율을 출력하세요.
midwest %>% group_by(county) %>% arrange(desc(popyouth)) %>% head(5) %>% select('county', 'popyouth')

# 문3. 분류표의 기준에 따라 미성년 비율 등급 변수를 추가하고, 각 등급에 몇 개의 지역이 있는지 알아보세요.
midwest$group <- ifelse(midwest$popyouth >= 40, "large", ifelse(midwest$popyouth > 30 | midwest < 40, "middle", "small"))
  
table(midwest$group)

# 문4. popasian은 해당 지역의 아시아인 인구를 나타냅니다. '전체 인구 대비 아시아인 인구 백분율'
#      변수를 추가하고, 하위 10개 지역의 state(주), county(지역명), 아시아인 인구 백분율을 출력하세요.
midwest$totalasian <- (midwest$popasian / midwest$poptotal) * 100

midwest %>% select('county', 'state', 'totalasian') %>% arrange(desc(midwest$totalasian)) %>% tail(10)