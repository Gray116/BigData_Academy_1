####################################
####### 2장. R Language 기초 #######
####################################


### 1. 도움말 기능 ###
# 1-1 도움말
? iris # iris 도움말 출력(1)
help(iris) # iris 도움말 출력(2)

# 1-2 검색
??iris
help.search('iris')

# 1-3 패키지(라이브러리)
# 설정되어있는 여러가지 데이터 셋을 확인 가능
library(help="datasets")

# 1-4 함수
methods(as) # 형변환 함수들

as.integer(1.25) # 함수 이름이 (as.integer)
? as.integer

x <- pi * c(-1:1,10)
as.integer(x)

# as.integer를 이용한 예제 출력
example("as.integer") 

data <- c(10,20,30) # 벡터 변수
mean(data) # data 벡터 변수들의 평균
? mean
example(mean)

# 1-5 주석
# = 주석
# 자동완성 list 보기 : tab키

# 1-6 정보
R.version
edit(iris)
attributes(iris)


### 2. 패키지 ###
# R내에 기본 패키지가 설치된다.
# 기본 패키지외의 패키지는 직접 다운받아야 한다.

# 패키지 설치 순서 #
dim(available.packages()) # CRAN 사이트에 업로드된 패키지 갯수 확인
available.packages()

# 1. 패키지 설치 : install.packages("패키지명")
install.packages("stringr")

# 2. 메모리 로드 : library("패키지 명")
library(stringr) 

# 3. 패키지 사용 : 로드된 패키지 안의 데이터나 함수 사용
? str_extract()
data <- '홍길동35이순신45김말똥12'
str_extract(data, '[1-9]{2}')
str_extract_all(data, '[1-9]{2}') # 1~9까지 숫자 중 두자리인 것

# 4. 메모리(패키지) 언로드 : detach("package:패키지명", unload = TRUE)
detach("package:stringr", unload = TRUE)

iris # 기본적으로 로드된 패키지(datasets)내 데이터
detach("package:datasets", unload = TRUE)

# 메모리에 로드 없이 데이터 사용해보기
rm(data) # data 변수를 삭제
data(iris, package = "datasets")
iris


### 3. 변수 ###
# 변수 할당 : <- , <<-, (=, ->)이 두가지는 잘 사용안된다.
# 전역변수
result <- 0
class(result)

# 지역변수 : 특정한 블록에서만 유효하다
add <- function(a, b) {
  result <<- a+b #전역변수에 할당 ( <<- )
  # result <- a+b 지역변수에 할당 ( <- )
  return(result)
}

add(10,20)
print(result) # 전역변수 값이 수정되었다.

# 변수 목록 조회
# 히든 변수 (글로벌 환경 리스트에 안보임)
.a <- 10
.a
x <- 10
y <- 10
( z <- x+y )

# 히든 변수를 제외하고 변수 목록을 출력
? ls
ls()
ls(all.names = TRUE) # 히든변수 포함
ls.str() # 변수이름과 구조를 함께 보여줌 (히든 변수 안보임)


### 4. 출력 ###
# 1) print
result <- 1
print(result)
(a <- 10)
msg <- "Hello, R\nHello, Python"
print(msg) # \n이 화면에 출력된다.

# 2) cat
# 여러 항목을 묶어서 출력할 때 유용하다.
cat(msg) # " "가 안나온다
cat("메세지는", msg)
cat("result =", result)

fibo <- c(0, 1, 1, 2, 3, 5, 8, 13, 21) # 벡터 (동일자료형의 집합)
cat("피보나치 수열 몇개 :", fibo, '\n')

# 3) paste
# 여러 문자열을 이어서 출력가능하다.
? paste
paste("result값은", result)
paste("Hello", "World", "Man", sep = "/") #sep은 띄어쓰기 공백에 문자를 추가 가능

temp <- paste(c(1, 2, 3), c("하나", "둘", "셋"), sep = "은(는) ") # 각각의 인덱스끼리 묶인다.
paste(c(1,2,3), c("하나", "둘", "셋"), sep = "은(는) ", collapse = ";")

# 4) 월이름:nth
month.abb # 월 이름 약자자
month.name # 월 이름름

c(1,2,3,4,5,6,7,8,9,10,11,12)
nth <- paste(1:12, c('st', 'nd', 'rd', rep('th', 9)), sep = "")
nth <- paste0(1:12, c('st', 'nd', 'rd', rep('th', 9)))
paste(month.name, nth, sep = ":")
paste(month.name, nth, sep = "은")
paste(month.name, nth, sep = "은", collapse="/")


### 5. 변수 삭제 ###
# 1) 특정 변수만 삭제 : rm() 사용
rm(nth)

# 2) 일반 변수 목록의 변수들 전부 삭제
rm(list = ls())

# 3) 히든 변수까지 전부 삭제
ls(all.names = T)
rm(list = ls(all.names = TRUE))

a <- 10
.a <- 10


### 연습문제1. kor변수에 "한국","일본","미국"
###        eng변수에 "Korea","Japan","USA"
###        한국:Korea, 일본:Japan, 미국:USA 를 출력
kor <- c('한국', '일본', '미국')
eng <- c('Korea', 'Japan', 'USA')
paste(kor, eng, sep=":", collapse = ", ")


### 연습문제2. MASS::Cars93 데이터를 출력
###        ex)datasets::iris
.libPaths() # 내 시스템에 R 패키지가 설치된 폴더
install.packages("MASS")
library(MASS)
# require("MASS") - 패키지가 없으면 경고가 나타난다.
Cars93
edit(Cars93)
head(Cars93) # 1~6행까지만
head(Cars93, 3) # 1~3행까지만
tail(Cars93) # 끝 6행만
tail(Cars93, 3) # 끝 3행만

detach("package:MASS", unload = TRUE)


### 연습문제3. 도움말
?mean # 함수 도움말
help(mean)
?iris # 데이터 도움말
library(help="MASS") # 라이브러리(패키지) 도움말