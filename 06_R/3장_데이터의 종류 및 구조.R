##########################################
####### 3장. 데이터의 종류 및 구조 #######
##########################################


### 1. 데이터의 종류 ###
# 기본 데이터 타입 - 문자, 숫자, 논리, (복소수)
# 스칼라 타입 - 변수 1개에 데이터 1개
a <- 10

# factor팩터(남, 여), vector벡터, list, matrix, array, date.frame, 날짜, 특별한 값(결측치)
a <- 10+7i; # complex
class(a) # 타입 출력


### 2. 기본 데이터 타입 ###
### numeric, character, logical(TRUE:T, FALSE:F), complex
a <- 'Hello'
a <- "Hello"
a <- 'I say, "Hello"'
a <- 'Hello
R'

cat(a)
class(a)
mode(a)
typeof(a)
methods(is) # is로 시작하는 함수들 출력

# 문자
is.character(a) # a가 캐릭터야? 참 or 거짓
as.character(100) # 100을 문자로 강제 형변환

# numeric : 정수, 실수
b <- 10.1
b <- 10
is.numeric(b)
as.character(b)
methods(as)
as.integer(10.9) # 매개변수를 정수로 (소수점 자리 버림)

# logical
c <- TRUE;
is.logical(c)
class(c)
as.numeric(c)

str(a) # str() : R의 내부 구조를 간결하게 표시
str(b)
str(c)

# 특별한 값(NULL, NA;, 결측치, NaN, Inf)
result <- 0
add <- function(a, b) {
  result <<- a+b
  return()
}

( temp <- add(1,2) )
result
( temp <- add(b=2, a=1))
is.null(temp) # temp가 NULL이야?

d <- c(2, 4, NA, 6, NaN, 10/0) # vector(동일 자료형 집합)
mean(d) # 평균계산(결측치가 있으면 결측치로 나옴)
mean(d, na.rm = TRUE) # 결측치를 제외한 값들의 평균 계산


### 3. 결측치(NA) 관련함수 ###
# is.na(d) : 결측치인지 아닌지 여부 반환
# complete.case(d) : d변수에 결측치가 없으면 TRUE
# na.omit(d) : 결측치 제외
# na.pass(d) : NA여부와 상관없이 처리

d <- c(2, 4, 6, NA, 8, 10)
d[1] # 인덱스는 1부터 시작

? is.na
is.na(d)
is.na(d[4])
d[is.na(d)] # 결측치만 나타남

complete.cases(d)
d[c(1,2,3,5,6)]

na.omit(d)
mean(d, na.rm = TRUE)
boxplot(d)


### 4. 팩터(factor) ###
# 범주형 데이터
# 순서식(미리 정해진 여러개 값 중 하나)
gender1 <- c('남','여','여','남')
gender1[4]
gender1[5] <- '남'
gender1[6] <- '중성'

gender <- factor(c('남','여','여','남'), levels = c('남', '여'))
gender[5] <- '중성'

gender
class(gender) # factor 변수의 타입은 factor라고 나온다.
str(gender)
na.omit(gender)

nlevels(gender) # facor의 카테고리가 몇개인지 알려준다.
levels(gender) # factor의 카테고리 구성을 알려준다.

level <- factor(c('좋음','보통','보통'),
                levels = c('매우나쁨','나쁨','보통','좋음','매우좋음'),
                ordered = TRUE)
level
level[4]='매우좋음'
level[5]='몰라'
nlevels(level)
levels(level)

gender <- c('남', '남', '여')
gender
class(gender)

# character <-> factor
# 1. character -> factor
gender <- as.factor(gender) # 비추천
gender <- as.character(gender)

gender

gender <- factor(gender, levels = c('남', '여')) # 추천
gender <- factor(gender, labels = c('남', '여')) # 추천


### 5. 구조형 변수, 복합형 변수 ###
# 변수 하나에 여러 값을 할당
# 1) 구조형 변수 : 동일 자료형
#                  ex) 벡터, 행렬(회귀분석, 2차원), 배열(n차원)
# 2) 복합형 변수 : 서로 다른 자료형을 가질 수 있다.
#                   ex) 리스트, 데이터프레임(csv)


## 5-1. 벡터
# 동일 자료형
# 자동 형변환 룰
data <- c(11,22,33,'test') # 문자, 숫자 - > 문자 (자동 형변환)
data <- c(11,22,33,TRUE) # 숫자, logical -> 숫자
data <- c('a', TRUE) # 문자, logical -> 문자
data <- c(10,20,1+10i,'hello',TRUE)
data
class(data)

data <- 1:4 # 1~4까지의 정수
data[4] <- 30
data

names(data)
names(data) <- c("A","B","C","D","E")

# 특정한 값 조회 ★★★★★
# data[n] n(숫자)번째 값 반환
# data['A'] : A열 값 반환
# data[c(m,n)] : m번째, n번째 값을 반환
# data[m,n] : m행 n열을 값 출력
# data[c('A열', 'B열', 'C열', ...)] : A열, B열, C열,... 값 반환
# data[c(1:4)] : 1번째, 2번째,... 4번째 값을 반환
# data[1:3] : 1, 2, 3번째 값을 반환
# data[-1] : 1(숫자)번째 값 제외
# data[-c(2,3)] : 2, 3번째 값 제외
# data[data>4] : 4보다 큰 값만 반환
# data[c('T','T','T','F','T')] : TRUE인 값만 반환

# 항목 갯수
# length(data)
# NROW(data)

2 %in% data # data에 2가 포함되어 있는지 여부(T/F)


### 문제1. 시험점수 변수를 만들어 출력하고, 전체 평균을 구한 후 출력
#          (평균=xx)
#          Yi, Kim, Yun, Lim, Lee, Park
#          80, 100, 90, 미응시, 70, 70
score <- c(80,100,90,NA,70,70)
score
names(score) <- c('Yi', 'Kim', 'Yun', 'Lim', 'Lee', 'Park')
avg <- mean(score, na.rm = TRUE)
cat('평균 =', avg)
paste('평균 =', avg)
score[score>=80]

temp <- score[complete.cases(score)] # 결측치를 제거
temp[temp>=80]

? complete.cases

### ※ 함수 ###
ax2_b.add <- function(a=0, b=0) { # 인자에 기본 값 설정
  return(2*a + b)
}

ax2_b.add() # 둘 다 기본값
ax2_b.add(10) # 첫번째 인자만 적용
ax2_b.add(b=10) # 두번째 인자만 적용하고 싶을 때
ax2_b.add(10,1)
ax2_b.add(b=10, a=1)
#######################################################


### 6. character() ###
# character 벡터를 생성하는 함수
charVec <- character() # 길이가 0인 문자 벡터
is.vector(charVec)
class(charVec)
length(charVec)

charVec[1] <- 'R'
charVec <- character(5) # 길이가 5인 문자 벡터터
charVec[1] <- '안녕'; charVec[2] <- 'R'; charVec[3] <- '수업중'
charVec[6] <- 'Test'


### 6-1. numeric()
intVec <- numeric() # 길이가 0인 숫자 벡터
is.vector(intVec)
class(intVec)
intVec[3] <- 12.2
intVec[5] <- 3.3
intVec[6] <- 'Hello' # 기존의 데이터들도 다 문자형으로 바뀜
intVec


### 6-2. logical()
logicVec <- logical(3) # 길이가 3인 logical 벡터(FALSE, FALSE, FALSE)
logicVec[1] <- TRUE
logicVec
logicVec[2] <- F


### 6-3. seq()
? seq
( a < - seq(from=1, to=10, by=1)) # 1(from)~10(to)까지 1(by)씩 증가
seq(from=1, to=10)
seq(1, 10)
seq(1, 10, 2)
seq(from=1, to=10, by=2)
a <- seq(1, 100, 11)
seq(from=1, to=100, length.out=11)
is.vector(a)
seq(10, -10, -2)
seq(0, 1, 0.1)
seq(1, 9, pi)


### 6-4. rep()
? rep
rep(x, times=1, length.out=NA, each=1)
rep(1:4, 2)
rep(1:4, times=2) # 순서가 다시 돌아오면 반복
rep(1:4, each=2) # 각각 두번씩 실행됨
rep(1:4, 2, 5, 2) # times=2, length.out=5, each=2

### 6-5 벡터의 연산 (+,-,*,/, 결합, (합,차,교)집합, 벡터 비교연산)
a <- c(1,2,3)
b <- c(10,20,30)

a+b
a-b
a*b
a/b
a %% b # 나머지 연산산
c(a,b) # 결합합

a <- c(1,2,3)
b <- c('Hello', 'R')
c <- c(TRUE, FALSE)
c(a,b,c) # 다른 타입의 벡터 결합시 타입이 자동 바뀜
# 자동 형변환 룰 : character > complex > numeric > logical

a <- append(a, c(4,5,6))
a <- append(a, 7) # 스칼라도 가능

# 벡터의 집합 연산 : union, intersect, setdiff, setequal(비교)
a <- c(1,2,3,4,5,6)
b <- c(2,4,6,8,10,12)
union(a, b)

intersect(a, b)
intersect(b, a)

setdiff(a, b) # a-b 차집합
setdiff(b, a) # b-a 차집합

setequal(a, b)
setequal(c(1,2,1), c(2,1))
setequal(a, c(intersect(a, b), setdiff(a, b) ))


### 7. 리스트 ###
# 복합 구조형 : 키 값 형태로 데이터를 담는 복합 구조형
student <- list(name='홍길동', age=25)
student

student['name']
student$name # 쓰임이 제일 많다 ★★
student[1] # $name [1] "홍길동"
student[[1]] # [1] "홍길동"

student$age <- NULL # student의 age제거
NROW(student) # 항목 갯수
length(student) # 항목 갯수
student$score <- 100
student
NROW(student)
length(student)

studentVect <- unlist(student) # 리스트를 벡터로 (동일 자료형으로 변환!)
is.vector(studentVect)
as.list(studentVect)
student2 <- as.list(studentVect)

student2
student


### 8. 매트릭스(행렬) ###
colMatrix <- matrix(1:15, nrow = 5, ncol = 3) # 5행 3열로 1부터 15까지
colMatrix # 1열부터 데이터가 나열되기 시작함

rowMatrix <- matrix(1:15, nrow = 5, ncol = 3, byrow = TRUE)
rowMatrix # 1행부터 데이터가 나열되기 시작함

# dimnames는 반드시 list여야 함
rowMatrix <- matrix(1:15, nrow = 5, ncol = 3, byrow = TRUE,
                    dimnames = list(c("R1", "R2", "R3", "R4", "R5"),
                                    c("C1", "C2", "C3"))
                    )
rowMatrix
rowMatrix[1,3] # rowMatrix[행, 열]
rowMatrix['R1','C3'] # R1행, C3열
rowMatrix[1:3, 1:2] # 1~3행, 1~2열 데이터터
rowMatrix[c(1,3,5), ] # 1,3,5행 데이터터
rowMatrix[c('R1', 'R3', 'R5'), ] # r1, r3, r5행 데이터
rowMatrix[, c('C2', 'C3')] # c2, c3열 모든 행 데이터터

dim(rowMatrix) # 차원수 (행, 열의 수)
NROW(rowMatrix) # 행 수, 소문자로 써도 됌
NCOL(rowMatrix) # 열 수, 소문자로 써도 됌

dimnames(rowMatrix) # 행, 열의 이름을 출력

rownames(rowMatrix) <- c('1행', '2행', '3행', '4행', '5행') # 행 이름 설정
colnames(rowMatrix) # 열 이름 설정
colnames(rowMatrix) <- c('kim', 'park', 'lee')

# 행렬 값 조회
rowMatrix['1행', 'kim', drop=FALSE] # 1행의 kim열의 데이터를 matrix 형태로 반환
rowMatrix['1행',] # 1행의 데이터가 벡터 형태로 반환
rowMatrix['1행', , drop = FALSE] # 1행 데이터가 matrix 형태로 반환
rowMatrix[c(1:3), c(1:2)]
rowMatrix[-3, c('kim', 'lee')] # 3행만 제외하고, kim,lee 열만 출력
rowMatrix[-3,] # 3행을 제외한 모든 행열 데이터
rowMatrix[-3] # 3번째 데이터를 제외한 모든 데이터가 벡터 형태(1차원)로 출력

# 행렬의 곱(%*%)
# 전치행렬(행과 열을 교환), 대각행렬(cf. 단위행렬), 역행렬
payMatrix <- matrix(c(12000, 22000, 18000), ncol = 3)
dimnames(payMatrix) <- list(c('시간당수당'), c('철수', '영희', '길동'))
payMatrix

workerMatrix <- matrix(c(c(5, 4, 9), c(7, 3, 2)), nrow = 3,
                       dimnames = list(c('철수', '영희', '길동'),
                                       c('5월', '6월'))
                       )
workerMatrix

# payMatrix(1x3) 곱 workerMatrix(3x2)
cost <- payMatrix %*% workerMatrix
rownames(cost) <- c('인건비')
cost['인건비', '5월']
cost['인건비', ]  

# 전치행렬 (행과 열을 바꾼 행렬)
rowMatrix <- matrix(1:15, nrow = 5, ncol = 3, byrow = T,
                    dimnames = list(c('r1', 'r2', 'r3', 'r4', 'r5'),
                                    c('c1', 'c2', 'c3'))
                    )
rowMatrix # 5x3 행렬
t(rowMatrix) # 3x5 행렬


# 역행렬
X <- matrix(1:4, nrow = 2, ncol = 2, byrow = F,
            dimnames = list(c('s1', 's2'),
                            c('r1', 'r2'))
            )
solve(X)
X %*% solve(X)

# 단위행렬 : 대각행렬을 구하는 diag() 함수 이용
diag(c(1,1)) # 2x2 단위행렬 
diag(rep(1,3)) # 3x3 단위행렬렬


######################################################
##### 행렬의 곱을 이용한 단변량 선형 회귀식 도출 #####
######################################################
x <- c(2, 4) # 독립변수_공부량
y <- c(40, 60) # 종속변수_점수

X <- matrix(c(x, rep(1, NROW(x))), nrow = NROW(x), ncol = 2, byrow = F)
Y <- matrix(y, ncol = 1)
X
Y

# X %*% ab = Y, (ab = W,b)
# solve(X) %*% X %*% ab = solve(X) %*% Y

ab <- solve(X) %*% Y
ab[1] # 기울기
ab[2] # 절편 : x축과 만나는 점의 좌표, y축과 만나는 점의 좌표

plot(x, y)
lines(x, x*ab[1]+ab[2], col = 2, lty='dotdash', lwd=4) # 빨강, 선스타일, 굵기

lines(x, y, col=1, lty=1)
# 공부량을 5시간으로 하면 예측되는 종속변수는?
ab[1]*8 + ab[2]


## 행렬의 곱을 이용한 선형회귀식 도출
x <- c(32, 64, 96, 118, 126, 144, 152.5, 158) # 독립변수
y <- c(18, 24, 61.5, 49, 52, 105, 130.3, 125) # 종속변수

X <- matrix(c(x, rep(1, NROW(x))), nrow = NROW(x), ncol = 2)

Y <- matrix(y)
Y

# X %*% ab = Y
# X(8x2행렬) t(X)가 2x8행렬 X %*% t(x) => 8x8 행렬
# t(X) %*% t => 2x2 행렬

# X %*% ab = Y
# t(X) %*% X %*% ab = t(X) %*% Y
# 좌우변에 solve(t(X) %*% X) %*% 추가
# solve(t(X) %*% X) %*% t(X) %*% X %*% ab = solve(t(X) %*% X) %*% t(X) %*% Y
# 단위행렬은 생략 가능
# ab = solve(t(X) %*% X) %*% t(X) %*% Y

ab <- solve(t(X) %*% X) %*% t(X) %*% Y
ab
lm(y~x) # 회귀식을 도출하는 함수 ★★★★★
plot(x, y)
lines(x, x*ab[1] + ab[2], col=2) # 기울기 + 절편


####################################################################
##### 행렬의 곱을 이용한 다변량(종속변수 3개) 선형 회귀식 도출 #####
####################################################################

### 1. 변수 설정 ###
x1 <- c(60, 65, 55) # 독립변수1 : 몸무게
x2 <- c(5.5, 5.0, 6.0) # 독립변수2 : 키
x3 <- c(1, 0, 1) # 독립변수3 : 흡연여부
y <- c(66, 74, 78) # 종속변수 : 기대수명

### 2. 행렬로 만들기 ###
X <- matrix(c(x1, x2, x3), nrow = NROW(x1), ncol = 3)
Y <- matrix(y, ncol = 1)

# X %*% ab = Y, 정방행렬
# solve(X) %*% X %*% ab = solve(X) %*% Y

### 3. 분석 ###
# ab = solve(X) %*% Y
ab <- solve(X) %*% Y # = solve(X, Y) = 기울기

# 80kg, 6.5ft, 비흡연중인 사람의 기대 수명은?
80*ab[1] + 6.5*ab[2] + 0*ab[3]

### 행렬을 데이터프레임으로 변환 ###
dimnames(X) <- list(c('Lee', 'Park', 'Kim'),
                    c('몸무게', '키', '흡연여부'))
dataFrame <- as.data.frame(X) # 데이터프레임으로 변환
class(X)
class(dataFrame)


# 행렬 연산
( a <- matrix(1:4, nrow = 2, ncol = 2) )
( b <- matrix(seq(10, 40, 10), nrow = 2, ncol = 2) ) # 10부터 40까지 10씩증가
a %*% b # 행렬끼리의 곱

a * b # 행렬 요소별 연산, ex) 1행 1열끼리 곱, 2행 2열끼리 곱
a + b
a - b
a / b
a %% b
a ^ b


### 9. 배열 ###
dataArray <- array(1:24, dim = c(3,4,2)) # 3차원 numeric 행렬 dim(3행,4열,2면)
dataArray

dataArray[3,2,1] # 3행 2열 1면의 데이터를 추출

dim(dataArray) # 차원
nrow(dataArray) # 행수
NROW(dataArray)
ncol(dataArray) # 열수
NCOL(dataArray)
length(dataArray) # 인스턴스의 갯수

dimnames(dataArray) <- list(c('1행', '2행', '3행'),
                            c('1열', '2열', '3열', '4열'),
                            c('x면', 'y면'))
dataArray
dim(dataArray) <- c(3, 8) # 차원 변경, 행렬 이름도 전부 사라진다
dataArray

dim(dataArray) <- c(3, 4, 2) # 수정하면 다시 설정해줘야 한다.
attr(dataArray, 'dim') <- c(3, 8) # reshape


### 10. 데이터 프레임 ###
# 매우매우매우매우 중요함
# (1) 데이터 프레임 생성
student_id <- c('20211', '20212', '20213', '20214')
student_name <- c('Jin', 'Eric', 'Den', 'Kei')
student_kor <- c(100, 95, 90, 85)
student_eng <- c(99, 94, 98, 84)
student_gender <- c('남', '여', '여', '남')

student_data <- data.frame(student_id, student_name, student_kor,
                           student_eng, student_gender)
edit(student_data)

st <- edit(student_data)
st

d <- data.frame(id = c(1, 2, 3), name = c('김', '홍', '이'))
d

# (2) 데이터 프레임에 열 추가 및 삭제
student_data$mat <- c(100, 95, 94, 80)
student_data$age <- c(20, 21, 22, 23)
student_data$age <- NULL # 열 삭제
student_data

# (3) 데이터 프레임의 열 형 변환
str(student_data) # 구조 확인
student_data$student_id <- as.numeric(student_data$student_id)
student_data$student_gender <- as.factor(student_data$student_gender)
student_data$student_gender <- as.character(student_data$student_gender)
student_data$student_gender <- factor(student_data$student_gender
                                      , levels = c('남', '여'))
summary(student_data) # 통계치를 보여줌

# (4) 데이터 프레임의 열 이름변경
# 특정적으로, 전체적으로 변경가능
library(reshape) # reshape이라는 패키지가 설치 안되어 있어서 에러 발생
.libPaths() # 패키지가 설치된 폴더

install.packages("reshape") # 1. 패키지 설치
require(reshape) # 2. 패키지 로드
library(reshape)
student <- rename(student_data, c("student_id" = "id"))
student <- rename(student, c("student_name" = "name",
                             "student_kor" = "kor",
                             "student_eng" = "eng",
                             "student_gender" = "gender"))
student

names(student_data) # 열들의 이름
names(student_data) <- c("id", "name", "kor", "eng", "gender", "mat")
student_data

# (5) 데이터 프레임 합치기
# rbind : 행합치기
newStudent <- rbind(student, student_data)
newStudent

# cbind : 열합치기
add_data <- data.frame(age = c(30, 31, 35, 28), nickname = c('개똥', '말똥', '길똥', '소똥'))
add_data
cbind(student, add_data)

# (6) 데이터프레임의 부분 데이터 조회
student <- rbind(student, student)

nrow(student) # 행 가로축
ncol(student) # 열 세로축
names(student)

# 1행 1열
student[1, 1]
# 1행 'id'열
student[1, 'id']
# 1행 모든 열 데이터
student[1, ]
# 모든 행의 1열 데이터
student[, 1, drop = F] # 데이터 프레임 형태로 반환
# 1~3행까지의 모든 열 데이터
student[1:3, ]
# 모든 행의 2,3,4,5열 데이터
student[ , c(2, 3, 4, 5)]
# 2,4,6 행외의 모든 데이터
student[-c(2,4,6), ]
# 1~3행 데이터에서 1열과 5열을 제외한 데이터
student[1:3, -c(1,5)]
# kor점수가 90점 이상인 모든 열의 데이터는?
student[student$kor >= 90, ]
# kor점수가 90점 이상인 사람의 이름과 kor 데이터
student[student$kor >= 90, c('name', 'kor')]

# subset 함수
subset(student, student$kor >= 90) # kor이 90이상인 모든 열의 데이터
subset(student, subset = (student$kor>=90) & (student$gender=='남')) # kor이 90이상인 남자의 모든 열 데이터
subset(student, select = c(1, 4)) # 1,4번째 열만 출력
subset(student, select = c(1:4))
subset(student, select = c('id', 'name', 'kor', 'eng'))
subset(student, select = -c(1, 4)) # 1열과 4열만 제외
subset(student, select = c('id', 'eng')) # id열과 col열 제외
subset(student, subset = (mat>=90 & gender=='여'), select = c('id', 'name', 'mat', 'kor'))

head(student) # 처음 6행만 출력
head(student, 3) # 처음 3행만 출력
student[c((nrow(student)-2) : nrow(student)), ]
tail(student, 3) # 마지막 3행만 출력
tail(student) # 마지막 6행만

emp <- read.csv(file.choose()) # 탐색기에서 선택한 csv파일을 emp 변수에 할당함
emp
head(emp)
tail(emp)
class(emp)

# (1) 직원 이름만출력
subset(emp, select = 'ename')
emp['ename']
emp$ename
emp[, 'ename', drop = F]
emp[, 2]
# (2) 직원이름, job, sal
subset(emp, select = c('ename', 'job', 'sal'))
emp[c('ename', 'job', 'sal')]
# (3) 이름이 KING인 직원의 empno, job, hiredate, sal
subset(emp, subset = (ename == 'KING'), select = c('empno', 'job', 'hiredate', 'sal'))
emp[emp$ename=='KING', c('empno', 'job', 'hiredate', 'sal')]
# (4) sal이 2000~3000 사이인 직원의 ename, sal
subset(emp, subset = (sal>=2000 & sal<=3000), select = c('ename', 'sal'))
emp[emp$sal>=2000 & emp$sal <= 3000, c('ename', 'sal')]


### 11. 타입 판별 및 타입 변환 ###
class(iris) # 타입 판별
class(iris$Sepal.Length) # 타입 판별

is.factor(iris$Species) # 특정 타입 판별
is.numeric(iris$Species)

str(iris$Species) # 구조보기로 타입 판별별

a <- c(1, 2, 3)

class(a) # 타입 판별
mode(a)
typeof(a)

a <- as.integer(a)

str(emp)
summary(emp)

emp$deptno <- as.factor(emp$deptno) # 데이터를 다운받을 경우 NA로 추정되는 값, 많이 비추
emp$deptno <- factor(emp$deptno, levels = c(10, 20, 30, 40))


### 12. 문자열과 날짜 ###
name <- 'Eric'
length(name) # 요소의 갯수
nchar(name) # 문자 길이

names <- c('Eric', 'Larray', 'Curly')
length(names)
nchar(names)

# 하위 문자열 추출하기
? substr
substr('ABCDEF', 1, 4) # 1~4번째 문자 추출
substr('ABCDEF', 4, 16) # 4~16번째 문자 추출. 없는 문자는 ""로 처리
substring('ABCEDF', c(1, 2), c(2, 3)) # 'AB', 'BC'

names <- c('Eric', 'Larray', 'Curly')
class(names)
substr(names, 1, 2) # names안의 각각의 문자 1~2번째 추출
# names 안에 각각의 이름의 맨 마지막자리 바로 앞글자부터 마지막 글자까지 출력
substr(names, nchar(names)-1, nchar(names))

# 문자열 연결하기
names <- c('Eric', 'Larray', 'Curly')

paste(names, 'loves', 'stars.')
paste(names, 'loves', 'stars', sep = '★')
paste0(names, 'loves', 'stars') # 띄어쓰기도 다 붙음
paste(names, 'loves', 'stars', sep = '★', collapse=',and ')

name <- c('Yi', 'Kim', 'Lim'); hobby <- c('swim', 'sleep', 'eat')
# Yi의 취미는 swim이고, Lim의 취미는 sleep이고, kim의 취미는 eat
name
hobby

paste(name, hobby, sep='의 취미는 ', collapse = '이고, ')

# 문자열 분할
path <- 'home/hadoop/data/speech.csv'
strsplit(path, '/')

customerInfo <- 'jin@gmail.com,010-8888-8888,seoul Korea'
strsplit(customerInfo, ',010-8888-8888,')

customers <- c('jin@gmail.com,010-8888-8888,Seoul Korea',
               'yis@gmail.com,010-9999-9999,Incheon Korea',
               'kim@naver.com,02-716-6111,Mapo')
strsplit(customers, ',[0-9]{2,3}-[0-9]{3,4}-[0-9]{4},')

# 문자열 대체
# sub(oldstr, newstr, string)
# 처음나오는 oldstr을 newstr로 바꿈
# gsub(oldstr, newstr, string) - 문장에 있는 oldstr을 전부 바꿈
s <- 'Curly is the smart one. Curly is funny, too.'

sub('Curly', 'Kim', s)

s1 <- 'Curly is the smart one. 


Curly is funny, too.'

s1 <- gsub('\n','',s1)

# 외적 : outer, 문자열의 모든 쌍별 조합 만들기
a <- c('aa', 'bb', 'cc')
b <- c('11', '22', '33')
outer(a, b, FUN = "paste") # 각각의 요소끼리 FUNCTION을 수행함

# 날짜
today <- Sys.Date()
today
class(today)

thatDay <- as.Date('21-06-29', '%y-%m-%d') # %Y는 년도 4자리, %y는 년도 2자리
thisDay <- as.Date('06/09/2021', '%d/%m/%Y')

if(thatDay < today) {
  cat('thatDay보다 today가 훗날')
}
today

#########################
######## 연습문제 #######
#########################

# 문1.
dim(iris) # 차원확인
str(iris) # 구조확인
colnames(iris) # 컬럼이름 확인

# 문1-2.
summary(iris) # 요약 통계 정보
head(iris$Sepal.Length, 10) # 처음 10개 조회


# 문1-3.
virginica <- subset(iris, subset = (iris$Species == 'virginica'))
head(virginica)
setosa <- subset(iris, subset = (iris$Species == 'setosa'))
head(setosa)

# 문1-4.
( rbind(setosa, virginica) )

# 문2.
Y <- subset(iris, subset = (Species == 'setosa'), select = c('Sepal.Length', 'Sepal.Width'))

# 문3.
timeMoney <- c(12000, 26000, 18000)

rowMatrix <- matrix(timeMoney, nrow = 3, ncol = 1, byrow = TRUE)
rownames(rowMatrix) <- c('A', 'B', 'C')
colnames(rowMatrix) <- '시급'

Awork <- c(5, 4, 9)
Bwork <- c(7, 3, 2)

A <- timeMoney %*% Awork
B <- timeMoney %*% Bwork

pay <- c(A,B)

C <- matrix(c(A,B), nrow = 1, ncol = 2,
            dimnames = list(c('급여'), c('Aworker', 'Bworker')))