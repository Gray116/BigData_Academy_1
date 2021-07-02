###########################################
####### 4. 제어문, 연산자, FUNCTION #######
###########################################


### 1. 제어문 ###
# (1) IF
num <- 9

if(num %% 2 == 0) {
  print(paste(num,"은(는) 짝수입니다."))
} else {
  cat(num,"은(는) 홀수입니다.")
}

# (2) IFELSE() 함수
# (num%2 == 0) ? "짝" : "홀" - 조건식, 참, 거짓
ifelse(num%%2 == 0, "짝수", "홀수")

( nums <- c(10, 9, 16, 17, 20) )
result <- ifelse(nums%%2 == 0, "짝수", "홀수")

matrix(c(nums, result), ncol = 5, byrow = T,
       dimnames = list(c("수", "홀짝"), c("1회", "2회", "3회", "4회", "5회")))

# (3) SWITCH() 함수
switch (2, "red", "green", "blue")
x <- switch (4, "red", "green", "blue")

# 연습문1. 사용자로부터 color 값을 받아 출력
? readline

colorValue <- as.integer(readline(prompt = "색상값은(red:1, green:2, blue:3) : "))
color <- switch(colorValue, "red", "green", "blue")
color
cat('선택하신 색상은', color)

# 연습문2. 사용자로부터 점수(1~100사이의 정수)를 입력받아 학점을 출력
score <- as.integer(readline(prompt = "점수(0~100)는 : "))
grade <- switch (as.integer(score/10)+1, "F", "F", "F", "F", "F", "F", "D","C","B","A","S")
cat('점수는',score,' / 학점은', grade)

# 함수 만들기 - 점수(50~100)를 입력받아 학점을 출력
getGrade <- function(){
  score <- as.integer(readline(prompt = "점수(0~100)는 : "))
  grade <- switch (as.integer(score/10)-4, "F", "D", "C", "B", "A", "S")
  print(paste("점수는 ", score, "/ 학점은 ", grade))
}
getGrade()


### 2. 반복문 ###
# (1) for
1:5
c(1,2,3,4,5)
c(1:5)
seq(1,5)
rep(1:5,2)

x <- c(-2, 5, 4, 8)
for (val in x) {
  cat(val, '\t')
}

# x 벡터에 짝수가 몇개 있는지 출력
count <- 0 # 짝수일때마다 증가할 count 변수

for (val in x) {
  if(val %% 2 == 0){
    count <- count + 1
  }
}
cat('짝수의 개수는', count)

# 안녕하세요를 10회 반복
for (i in 1:10) {
  cat(i, '안녕하세요', '\n')
}

# factorial.R을 로드해서 사용해보기
getwd() # 시스템 working directory
source('factorial.R') # UTF-8로 인코딩된 한글 부분을 출력
Sys.getlocale() # Windows의 기본 인코딩은 CP949 그래서 에러 발생(한글이 포함시)

source('factorial.R', encoding = 'utf-8')
fact(7)

# (2) while
# 조건이 참이면 반복문 수행
i <- 1
while (i < 6) {
  print(i)
  i <- i + 1
}

# (3) repeat
# break가 없으면 무한 반복
i <- 1
repeat {
  if(i>=6) break;
  print(i)
  i <- i + 1
}

# (4) break, next(=continue)
x <- 0
while (x < 7) {
  x <- x + 1
  if(x == 3) break;
  cat(x, '')
}

# next는 현재 수행 중인 반복문 블록을 중단하고, 다음 반복을 시작
for ( i in 1:10) {
  cmd1 # i = 1~4 까지 cmd1,2,3 계속 실행. 
  cmd2
  
  if( i == 5 ) { # i가 5일 때만, cmd3 생략. 다음 반복을 시작
    next   
  }
  cmd3                
}
cmd4   


#################
### 3. 연산자 ###
#################
# (1) 벡터 연산
x <- c(11, 2, 3) # 3개짜리
y <- c(1, 12, 3) # 3개짜리

x + y
x > y
x ^ y
x %% y

x <- c(11, 2, 13, 1, 1)
y <- c(1, 12, 3)

x + y
x + 1
y + x

# (2) 논리 연산
TRUE && TRUE

x <- c(T,T,F,F)
y <- c(T,F,T,F)

x & y # 각각의 요소끼리 체크
x | y

x && y # 첫번째 요소끼리만 체크
x || y

# (3) 중위연산자
5+8
'+' (5,8)
'%@%' <- function(a, b) {
  return(2*a+2*b)
}

10 %@% 15
10 %in% c(10, 20, 30)

'%*%' <- function(a, b){
  return(a+b)
}

a <- matrix(1:4, ncol = 2)
b <- matrix(c(1,0,0,1), ncol = 2)
a
b
a %*% b
rm(list = ls())

# %o% - 외적
# %*% - 내적 (행렬의 곱)

a <- c('1', '2', '3')
b <- c(10, 20, 30)
outer(a, b, FUN = paste)

matrix.a <- matrix(1:6, nrow = 3) # 3행 2열
matrix.b <- matrix(1:6, nrow = 2) # 2행 3열

matrix.a %*% matrix.b


###############
### 4. 함수 ###
###############
pow <- function(x, y=0) {
  return(x^y)
}

pow1 <- function(x=0, y) {
  return(x^y)
}

pow1(2,3)
# pow1(2) - 에러
pow1(y=2)
pow1(y=2, x=3)
# 명시적으로 return()을 사용할 경우 NULL이 return됨
# 명시적으로 return함수가 없는 경우 : 마지막에 실행된 표현식의 값이 자동으로
#                                     return 됨
check <- function(x){
  if (x>0) {
    result <- '양수'
  } else if (x<0) {
    result <- '음수'
  } else {
    return <- '0 이네'
  }
}
( temp <- check(9) )
( temp <- check(0) )

# 가변인자 함수
total()
total(1)
total(1,2)
total(1,2,3,4,5)

total <- function(...) {
  args <- c(...)
  sum <- 0 # 누적 합 변수
  for (val in args) {
    sum <- sum + val
  }
  return(sum)
}

total(3, 8, 10)

# 재귀함수 - 함수내에서 내 함수를 호출하는 함수
# fact(3) = 3*2*1
# recurse.fact(3) = 3 * recurse.fact(2)
#                 = 3 * 2 * recurse.fact(1)
# fact(n) = n * recurse.fact(n-1)
# recurseFact(자바)
# recurse_fact
recurst.fact <- function(num){
  if (num < 0) {
    cat('음수 값 팩토리얼은 없다.')
  } else if (num == 0) {
    return(1)
  } else {
    return(num * recurst.fact(num - 1))
  }
}
recurst.fact(3) # 3 * recurse.fact(2) = 3 * 2 * recurse.fact(1)

temp <- recurst.fact(-1)
temp


##########################
### 5. 환경과 유효범위 ###
##########################
environment()
ls()
f <- function(f_x){
  g <- function(g_x){
    print('g 함수 안')
    print(environment())
    print(paste('g 함수 영역에서의 변수들 :', ls()))
  }
  g(5)
  print('f 함수 안')
  print(environment())
  cat('f 함수 영역에서의 변수들:', ls())
}

# 연습문1. if과 for문을 이용하여 매개변수가 소수인지 아닌지
#          TRUE나 FALSE를 return하는 함수를 작성하고 호출
numChk <- function(num){
  flag <- TRUE
  last <- (num / 2)
  
  if (num > 1) {
    for (val in 2:last) {
      if (num %% val == 0){
        flag = FALSE
        break
      }
    }
  } else if (num == 1){
    cat('1이하의 수는 해당 안됨')
  } else {
    cat ('0 또는 음수는 해당 안됨')
  }
  return(flag)
}

numChk(9)
numChk(17)