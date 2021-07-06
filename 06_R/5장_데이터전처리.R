################################
####### 5. 데이터 전처리 #######
################################


######################
### 1. 파일 입출력 ###
######################
# 1.1 시스템 인코딩 조회
Sys.getlocale() # windows는 cp949

# 1.2 write.table
# 데이터를 파일에 저장하는 방법
class(iris)
? write.table
write.table(iris, file = 'outData/iris.csv', sep = ",")
write.table(iris, file = 'outData/iris.csv', sep = ",", row.names = F)

InsectSprays
summary(InsectSprays)

write.table(InsectSprays, file = 'outData/insect.csv', sep = ",", row.names = F)

# 1.3 read.table
# 파일의 내용을 데이터프레임 형태로 읽어옴
? read.table
irisData <- read.csv('outData/iris.csv', sep = ",", header = T,
                     encoding = 'utf-8')
head(irisData)
str(irisData)
summary(irisData)

irisData <- read.table('outData/iris.csv', sep = ",", header = T,
                       encoding = 'utf-8', stringsAsFactors = T)
# stringAsFactors : 문자형으로 지정된 열을 전부 factors로 바꿔줌
str(irisData)

emp <- read.table('inData/emp.csv', sep = ",", header = T, stringsAsFactors = T)

str(emp)

# 1.4 write.csv
write.csv(iris, file = 'outData/iris1.csv')
write.csv(iris, file = 'outData/iris1.csv', quote = F, row.names = F)

# 1.5 read.csv - 정말 많이 쓰임
newIris <- read.csv('outData/iris1.csv', header = T)
head(newIris)
str(newIris)

newIris$Species <- as.factor(newIris$Species)
str(newIris)
newIris$Species <- as.character(newIris$Species)
newIris$Species <- factor(newIris$Species, levels = c('setosa', 'versicolor', 'virginica'))
newIris[c(1, 51, 101), 'Species']

str(newIris)

# 1.6 cat을 이용한 text 출력
cat('Hello, R', file = 'outData/irisSummary.txt', append = T)

irisSummary <- summary(iris)
dim(irisSummary)

cat('iris 통계 요약치', '\n', file('outData/irisSummary.txt'))

for (i in 1:nrow(irisSummary)) {
  cat(irisSummary[i, ], '\n', file = 'outData/irisSummary.txt', append = T)
}



###############################
### 2. apply 계열 함수 적용 ###
###############################
# 2.1 apply (대상자료, 1(행) or 2(열), 함수)
# iris 데이터의 열 별 평균(합계, 표준편차, 최솟값, 최댓값, 중앙값)
? apply
apply(iris[, -5], 2, mean)
apply(iris[, -5], 1, mean)

apply(iris[, 1:4], 2, FUN = mean) # fun = function
apply(iris[, 1:4], 2, FUN = sum)
apply(iris[, 1:4], 2, FUN = sd)
apply(iris[, 1:4], 2, FUN = min)
apply(iris[, 1:4], 2, FUN = max)
apply(iris[, 1:4], 2, FUN = median)

unique(iris$Species)
levels(iris$Species)

# 종류별 (setosa, versicolor, virginica), 열 별 평균 구하기
setosa <- apply(iris[iris$Species == 'setosa', -5], 2, FUN = mean)
versicolor <- apply(iris[iris$Species == 'versicolor', -5], 2, FUN = mean)
virginica <- apply(iris[iris$Species == 'virginica', -5], 2, FUN = mean)
data.frame(setosa, versicolor, virginica)

# 학생
name <- c('김', '홍', '박', '이', '윤')
kor <- c(90, 95, 97, 96, 80)
eng <- c(80, 95, 95, 97, 100)
mat <- c(70, 75, 86, 91, 100)
student <- data.frame(name, kor, eng, mat)
student

# 학생 별 과목 평균
m <- apply(student[, -1], 1, FUN = mean)
names(m) <- name
m

# 과목 별 평균
apply(student[, -1], 2, FUN = mean)

# 2.2 lapply
# list apply (대상 데이터 결과도 list)
lapply(iris[1:4], mean)
listIris <- as.list(iris[1:4])

lapply(listIris, mean)

# exp(-3, 3) : e의 -3승부터 3까지 7개 데이터 출력
x <- list(a=1:10, beta=exp(-3:3), logic = c(T,F,F,T,T))

lapply(x, quantile)
quantile(c(1:10))
quantile(exp(-3:3))

# 2.3 sapply
# lapply와 유사하나 결과가 행렬이나 벡터로 반환
? sapply

sapply(iris[1:4], mean)
sapply(x, mean)
sapply(x, quantile, 1:3/4)

fivenum(1:100)
seq(1,100, length.out = 5)
i39 <- sapply(c(3:9), seq)
i39

lapply(i39, fivenum)
sapply(i39, fivenum)

# 2.4 vapply
# sapply와 유사하나 FUN의 결과 값이 FUN.VALUE와 호환되는지 확인
vapply(i39, FUN = fivenum, FUN.VALUE = c(numeric(1), numeric(1), numeric(1), numeric(1),
                                         numeric(1))
       )
sapply(iris[1:4], mean)
vapply(iris[1:4], mean, FUN.VALUE = numeric(1))

citis <- c('Seoul', 'Busan', 'New York', 'Tokyo')
nchar(citis) # 각 요소의 글자 개수
lapply(citis, list) # 결과가 list형태로 나타난다.
sapply(citis, nchar)
vapply(citis, nchar, FUN.VALUE = numeric(1)) # 적용 함수의 값 체크

# 2.5 mapply
# 함수를 적용할 때, 여러 개의 인자를 함수에 전달
rep(c(1,2,3), times=3) # 반복을 3번
rep(c(1,2,3), each=2) # 각각 요소를 반복후 다음 인자 반복
mapply(rep, x=1:4, times=4:1) # 1부터4까지, 각 요소를 4번~1번씩 각각 호출
mapply(rep, x=1:4, each=c(4,3,2,1))

# 연습문1. 직업별 수입, 결측치 대치
job <- c(3,3,5,2,2,3,5,3,4,4,6,3) # 직업
income <- c(4879, 6509, 4183, 0, 3894, 0, 3611, 6454, 4975, 8780, 0, 4362) # 소득

length(job)
length(income)

cust <- data.frame(job, income)
cust

income.avg <- c(862, 0, 3806, 3990, 3891, 3359, 3556, 2199, 227)
length(income.avg)

names(income.avg) <- 0:8
income.avg

income.avg['2'] # 직업코드가 '2'번인 직업의 평균 수입
income.avg[3] # 직업코드가 '2'번인 직업의 평균 수입

zero2mean <- function(job, income){
  if (income == 0 & job != 1) { # 결측치 일때 (1번만 무직이기 때문에)
    return (income.avg[as.character(job)])
  } else {
    return(income)
  }
}

# for (i in 1:nrow(cust)) {
#   cust[i, 'income'] <- zero2mean(cust[i, 'job'], cust[i, 'income'])
# }
cust$income2 <- mapply(zero2mean, cust$job, cust$income)
cust

apply(iris[, -5], 2, mean)



#############################
### 3. 데이터 그룹화 함수 ###
#############################
# 3.1 tapply
# 주어진 함수(1개)를 그룹별로 각 자료값에 적용하는 함수 (1개열만 가능!)
tapply(iris$Sepal.Length, iris$Species, FUN = mean)

tapply(iris[, 'Sepal.Length'], iris['Species'], FUN = mean)
# 두개 열 이상을 그룹화하고 싶으면 by나 aggregate를 사용해야한다.

tapply(iris$Sepal.Length, iris[c('Species')], FUN = sum)
# 두개 이상의 함수를 사용하려면 summaryBy를 사용해야한다

tapply(iris$Sepal.Length, iris$Species, FUN = sd)
boxplot(iris$Sepal.Length ~ iris$Species)
vioplot(iris$Sepal.Length ~ iris$Species) # 중간 흰점이 중위수

library(vioplot)
install.packages('vioplot')
require(vioplot)

# 직업군별
str(cust)
tapply(cust$income2, cust$job, FUN = mean) # 1은 무직
cust$job <- factor(cust$job, levels = 0:8)
levels(cust$job)
tapply(cust$income2, cust$job, FUN = mean) # 없는 그룹은 NA
tapply(cust$income2, cust$job, FUN = mean, default = -1) # default 값은 NA 대체 값

# 스프레이의 종류에 따른 살충효과를 점검해보기
datasets::InsectSprays
head(InsectSprays)
str(InsectSprays)

tapply(InsectSprays$count, InsectSprays$spray, FUN = mean)
tapply(InsectSprays$count, InsectSprays$spray, FUN = sd)

boxplot(InsectSprays$count ~ InsectSprays$spray)
vioplot(InsectSprays$count ~ InsectSprays$spray)

# 3.2 by
# 1개 이상의 열에 대해 1개의 함수로 그룹화 처리(mean, sd는 안됨 = 나누기를 해야하는 경우)
by(iris[c('Sepal.Length', 'Sepal.Width')], iris['Species'], FUN = summary)
by(iris$Sepal.Length, iris$Species, FUN = mean)

# cust의 직업(job)별 평균을 income과 income2를 한꺼번에 출력 (fun = summary)
by(cust[c('income', 'income2')], cust['job'], FUN = summary)

# 3.3 summaryBy
library(doBy)
install.packages('doBy')
? summaryBy

summaryBy(
  Sepal.Length + Sepal.Width ~ Species,
  iris,
  # default function은 mean(평균)
)

summaryBy(
  Sepal.Length + Petal.Length ~ Species,
  iris,
  FUN = c(mean, sd)
)

# 연습문1. emp.csv 파일을 열어, 부서별 급여와 상여금을 비교해보기
str(emp) # (1) 구조확인

emp <- read.table("inData/emp.csv", header = T, sep = ",") # (2) 파일 불러오기
# emp <- read.csv("inData/emp.csv", header = T)

emp$deptno <- factor(emp$deptno, levels = c(10, 20, 30, 40)) # (3) 팩터 설정

summaryBy(sal + comm ~ deptno, emp, na.rm = T, FUN = c(mean, sd))

# 연습문2. 부서별, 직업별 급여와 상여금 비교 (mean, sd)
str(emp)
emp$job <- as.factor(emp$job)

summaryBy(sal + comm ~ deptno + job, emp, FUN = c(mean, sd), na.rm = T)

# 3-4. doBy 패키지
# 3-4.1 orderBy
# 열 기준으로 정렬한 데이터 프레임
? orderBy

orderBy(~ Sepal.Length, data = iris) # Sepal.Length 기준으로 오름차순(Default)
orderBy(~ Sepal.Length + Petal.Length, data = iris) # Sepal.Length가 첫번째 정렬 기준
                                                    # Petal.Length가 두번째 정렬 기준
orderBy(~ Species + Sepal.Length, data = iris)  # Species가 첫번째 정렬 기준
                                                # Sepal.Length가 두번째 정렬 기준

# Sepal.Length 기준으로 내림차순 정렬을하는데 Sepal.Length가 같으면 Species를
# 알파벳 순으로 정렬
orderBy(~ -Sepal.Length + Species, data = iris)

# Sepal.Length 기준으로 내림차순 정렬을하는데 Sepal.Length가 같으면 Petal.Length를
# 내림차순 정렬
orderBy(~ -Sepal.Length + -Petal.Length, data = iris)

# 종류별, Sepal.Length별 오름 차순으로 정렬한 데이터의 Sepal.Length, Species열만 출력
orderBy(~ Species + Sepal.Length + Petal.Length, data = iris[c('Sepal.Length', 'Species', 'Petal.Length')])

orderBy(~ Species+Sepal.Length+Petal.Length, data = iris)[, c('Sepal.Length', 'Species', 'Petal.Length')]

# 연습문1. emp 데이터셋에서 월급이 적은순으로 ename, sal을 추출
orderBy(~ sal, data = emp[c('ename', 'sal')])

# 연습문2. emp 데이터셋에서 월급이 적은순으로 5명만 ename, sal을 추출
head(orderBy(~ sal, data = emp)[, c('ename', 'sal')], 5 )

# 3-4.2 simpleBy
# 그룹별 데이터를 샘플링
library(doBy)
sampleBy(~ Species, data = iris, frac = 0.2) # franc의 기본값은 10%
                                             # 종별 20%씩 비복원 추출
sampleBy(~ Species, data = iris, frac = 0.2, replace = T) # 종별 20%씩 복원추출
sampleBy(~ Species, data = iris, systematic = T) # 계층적 추출

sample(1:150, 10) # 1~150중 10개 뽑기(순서 상관없이)
iris[sample(1:nrow(iris), 10), ]



#################
### 4. Fomula ###
#################
# lm(종속변수 ~ 독립변수) - 선형회귀식 도출 함수
# 독립변수가 1개
x <- c(1, 2, 3, 4, 5) # 공부량(독립변수)
y <- c(20, 45, 55, 82, 99) # 점수(공부량)
y <- c('C', 'C', 'B', 'B', 'A') 
y <- c(F, F, F, T, T) # 로지스틱 회귀분석을 해야한다.

plot(x, y)

fit <- lm(y ~ x) # y= 19.5x + 1.7(인터셉트)

lines(x, x*19.5 + 1.7, col = 'red')
abline(fit, lty = 'dashed', lwd = '3')

# 독립변수가 2개
x1 <- c(1, 2, 3, 4, 5) # 공부량
x2 <- c(10, 20, 3, 4, 5) # 문제집 푼 갯수 
y <- c(60, 80, 63, 84, 95) # x1과 x2 사이의 상관관계가 없다는 전제에서 독립변수2개 설정

lm(y ~ x1 + x2) # y = 11.083*x1 + 1.417*x2 + 31.250


# datasets::cars
# 속도에 따른 제동거리의 관계를 선형회귀식으로 도출
class(cars)
nrow(cars)
str(cars)

fit <- lm(dist ~ speed, data = cars)
# fit <- lm(cars$dist ~ cars$speed)

plot(cars$speed, cars$dist)

lines(cars$speed, 3.932*cars$speed - 17.579, col = 'red', lwd = '2')
abline(fit, lty = 'dotted' ,lwd = '3')



######################
### 5. 데이터 분리 ###
######################
# 5.1 split
? split

iris.species <- split(iris, iris$Species) # 종 별로 데이터를 분리
iris.species['setosa'] # 리스트 형태로 반환된다.
iris.species['versicolor']
iris.species['virginica']

iris.sepal <- split(iris, iris$Sepal.Length > mean(iris$Sepal.Length))
iris.sepal$'TRUE' # Sepal.Length의 평균보다 큰 그룹들이 추출된다.
iris.sepal$'FALSE'

# 5.2 subset
? subset

# Sepal.Length가 4이상인 데이터만 추출(Sepal.Length, Petal.Length, Species)
fit <- subset(iris, subset = Sepal.Length >= 4, select = c('Sepal.Length', 'Petal.Length', 'Species')) # 행의 조건은 subset, 열의 조건은 select

orderBy(~ Sepal.Length, data = fit)



########################
### 6. 데이터 합치기 ###
########################
# 6-1. 열 합치기
# cbind()
( student.a <- data.frame(name = c('lee', 'kim'), score = c(100, 90)))
( student.b <- data.frame(id = c(101, 102), gender = c('여', '남')))
( student <- cbind(student.a, student.b)[, c(3,1,2,4)])

# 행 합치기
# rbind()
( student.a <- data.frame(name = c('lee', 'kim'), score = c(100, 90)))
( student.b <- data.frame(name = c('yun', 'ham', 'park'), score = c(95, 85, 80)))
( student <- rbind(student.a, student.b))

# 병합하기
# merge()
( student.a <- data.frame(name = c('lee', 'kim'), kor = c(100, 90)))
( student.b <- data.frame(name = c('lee', 'kim'), eng = c(95, 90), mat = c(94, 80)))
( student <- merge(student.a, student.b))

( student.a <- data.frame(name = c('lee', 'park'), kor = c(100, 90)))
( student.b <- data.frame(name = c('lee', 'kim'), eng = c(95, 90), mat = c(94, 80)))
( student <- merge(student.a, student.b, all = T)) # 결측치도 포함된다.



######################
### 7. 데이터 정렬 ###
######################
# 7.1 sort()
# 정렬된 데이터(1차원) 반환
data <- c(10, 30, 100, 1, 3)
names(data) <- c('첫번째', '두번째', '세번째', '네번째', '다섯번째')

sort(data, decreasing = T)
sort(iris$Sepal.Length)

# 7.2 order()
# 정렬된 데이터의 인덱스 반환
data <- c(10, 30, 100, 1, 3)
names(data) <- c('첫번째', '두번째', '세번째', '네번째', '다섯번째')

order(data)
data[order(data)]

# iris 데이터를 Sepal.Length 기준으로 내림차순 정렬
orderBy(~ -Sepal.Length, data = iris)

sort(iris$Sepal.Length, decreasing = T) # 데이터를 내림차순으로
order(iris$Sepal.Length, decreasing = T) # 데이터의 인덱스번호를 내림차순으로

iris[order(iris$Sepal.Length, decreasing = T), ] # Sepal.Length기준으로 내림차순

# iris 데이터를 Sepal.Length 기준으로 내림차순 정렬 (단, Sepal.Length, Species)
orderBy(~ -Sepal.Length, data = iris)[, c('Sepal.Length', 'Species')]
iris[order(iris$Sepal.Length, decreasing = T), c('Sepal.Length', 'Species')]

# 연습문1. emp 데이터셋에서 월급이 많은 순으로 ename, sal을 추출
emp <- read.csv("inData/emp.csv", header = T)
emp[order(emp$sal, decreasing = T), c('ename', 'sal')]

# 연습문2. emp 데이터셋에서 월급이 많은 Top5의 ename, sal을 추출
head(emp[order(emp$sal, decreasing = T), c('ename', 'sal')], 5)

# 연습문3. emp 데이터셋에서 월급이 적은 Top5의 ename, sal을 추출
head(emp[order(emp$sal), c('ename', 'sal')], 5)
emp[order(emp$sal, decreasing = T), c('ename', 'sal')][nrow(emp)-5:nrow(emp), ]



##################################
### 8. 데이터 프레임 이름 생략 ###
##################################
# 8.1-1 with
# 리스트 내 필드를 필드 이름만으로 접근할 수 있게 해주는 함수
iris.temp <- iris
iris.temp[c(1,3), 1] <- NA
head(iris.temp, 3)

# Sepal.Length의 종별 중앙값
mps <- tapply(iris.temp$Sepal.Length, iris.temp$Species, FUN = median, na.rm = T)

mps['setosa']
mps['versicolor']
mps['virginica']

iris.temp$Sepal.Length2 <- iris.temp$Sepal.Length # Sepal.Length가 NA가 아닐 경우
iris.temp$Sepal.Length2 <- mps[iris.temp$Species] # Sepal.Length가 NA일 경우

iris.temp$Sepal.Length2 <- ifelse( is.na(iris.temp$Sepal.Length),
                                   mps[iris.temp$Species],
                                   iris.temp$Sepal.Length
                                   )
head(iris.temp[, c('Sepal.Length', 'Sepal.Length2')], 3)

Sepal.Length2 <- with(iris.temp, {
  Sepal.Length <- ifelse( is.na(Sepal.Length),
                           mps[Species],
                           Sepal.Length
                           )
})
head(iris.temp)


# 8.1-2 within
# 결측치가 대치된 데이터 프레임이 반환된다. 수정하는 기능까지 있다.
iris.temp <- within(iris.temp, {
  Sepal.Length <- ifelse( is.na(Sepal.Length),
                          mps[Species],
                          Sepal.Length
                          )
})
head(iris.temp)

# 8.2-1 attach()
# attach()는 이들 함수 호출 후 모든 코드에서 컬럼들을 직접 접근할 수 있게 한다.
attach(iris)
summary(iris$Species)
summary(Species)

find('Species')

Sepal.Length

tapply(Petal.Length, Species, mean)

# 8.2-2 detach()
# attach()의 기능을 해제한다.
detach(iris)



######################
### 9. 데이터 집계 ###
######################
# 9.1 table()
table(iris$Species) # 종별 갯수

# InsectSprays 데이터셋에서 spray 별 집계
table(InsectSprays$spray)

# emp 데이터셋에서 deptno별 집계
table(emp$deptno)

# 9.2 aggregate()
# 1개 이상의 열에 대해, 1개 이상의 그룹화 처리 (적용함수는 1개씩)
aggregate(iris[, 1:4], by = list(iris[, 5]), FUN = mean)

# 보험회사 고객들의 <보험금 청구 데이터>에서 고객 별 입원일 조회
cust_id <- c(1001, 1002, 1001, 1003, 1001, 1004, 1005, 1001, 1002, 1001)
hos_day <- c(2, 3, 20, 1, 2, 0, 5, 3, 2, 6)

data <- data.frame(cust_id, hos_day)

day_per_cust <- aggregate(data$hos_day, by=list(data$cust_id), FUN = sum)
class(day_per_cust)
names(day_per_cust) <- c('고객ID', '입원일')
order(-day_per_cust$입원일)

day_per_cust[order(-day_per_cust$입원일), ]



######################
### 9. 데이터 색인 ###
######################
# 9.1 which()
which(iris$Species == 'setosa')
iris[which(iris$Species == 'setosa'), ]

which.min(iris$Sepal.Length) # 데이터의 인덱스로 추출된다.
iris[which.min(iris$Sepal.Length), ]

which.max(iris$Sepal.Length) # 데이터의 인덱스로 추출된다.
iris[which.max(iris$Sepal.Length), ]