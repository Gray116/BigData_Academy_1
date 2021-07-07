##############################
##### 8장. 데이터 시각화 #####
##############################
### 시각화 개요 : 원본 데이터나 분석된 결과 데이터를 그래프로 표현
## 1.1 R의 그래픽 시스템
# 1) base graphic system : 전통적인 그래픽 관련 함수 이용
#                          그래프 종류 별 함수가 각기 달라 정교한 그래프 이용시 노력 필요
#                          (고수준 그래프 함수, 저수준 그래프 함수)
# 2) grid graphic system : bgs의 한계 극복을 위해 만든 패키지 (ggplot2)
#                          유연한 그래프 환경을 제공한다.

# ex.
plot(mtcars$wt, mtcars$mpg)
boxplot(mtcars$mpg)
fit <- lm(mtcars$mpg ~ mtcars$wt)
fit <- lm(mpg ~ wt, data = mtcars)

fit

abline(fit, col = 'red')

# ex2. grid graphic system
library(ggplot2)
ggplot(data = mtcars, aes(x = wt, y = mpg)) + # 그래프 초기화
  geom_point(col = 'violet', pch = 2) + # mpg, wt에 대해 데이터 표기
  labs(title = "첫 산점도 예제") + # 제목
  geom_smooth(method = "lm")

ggplot(data = iris, aes(x = Species, y = Sepal.Length)) +
  geom_boxplot(fill = 'red')


## 1.2 그래프 함수
# 고수준 함수 - plot, barplot, boxplot, hist, pie, ...
#               그래픽 창을 새롭게 열어 그래프를 그릴 수 있게 해주는 함수
# 저수준 함수 - lines, abline, point, text
#               열려있는 그래픽 창에 점, 화살표, 선과 같이 부수적인 요소를 추가


## 1.3 그래프 파라미터
# 그래프를 그리는 함수에는 다양한 파라미터가 존재하고, par()함수를 통해 변경한다.
# (1) par() - 그래프 환경을 조정
? par
plot(cars)
oldPar <- par(bty = 'L') # 파라미터 지정 전 객체를 저장
plot(iris)
plot(cars)
par(oldPar) # oldPar 설정으로 복귀된다.

plot(cars, xlab = "x label", ylab = "y label", main = "제목") # 그래프 축 이름 및 제목 변경
fit <- lm(dist ~ speed, data = cars)
abline(fit, col = 'red', lwd = 2, lty = 'dashed') # lwd : 선 굵기, lty : 선 종류

colors()

# (1-1) par()함수의 다른 파라미터 사용 예
x <- 1:100
y1 <- rnorm(100) # 평균이 0이고 표준편차가 1인 수 100개 추출
y2 <- rnorm(100) + 100 # 평균이 100이고 표준편차가 1인 수 100개 추출

oldPar <- par(mar = c(5, 5, 5, 5)) # mar : 그래프 여백(하, 좌, 상, 우)

plot(x, y1, pch = 21, type = "b", bg = 'red', ylim = c(-8, 2), # pch : 찍히는 점의 스타일
     yaxt = "n", bty = "n", ylab = "")                         # type : plot의 종류
                                                               # bg : 21~25번의 pch에만 해당
                                                               # ylim : y축의 범위 설정
                                                               # yaxt : y축의 수치 표시를 없앰.
axis(side = 2, at = c(-2, 0, 2), col = 'red') # side : 1하, 2좌, 3상, 4우
                                   # 저수준 그래프, at축이 그려질 위치
mtext("red line(y1)", side = 2, line = 2, at = 0, col = 2)

par(new = TRUE) # 기존 그래프를 지우지 않고 덧그림

plot(x, y2, pch = 20, type = "b", col = 'blue', yaxt = "n",
     ylim = c(98, 108), ylab = "", bty = "n")
axis(side = 4, at = c(98, 100, 102), col = 'blue')
mtext("blue line(y2)", side = 4, line = 2, at = 100, col = 'blue')

par(oldPar) # 그래프 영역 설정 원상 복구


## 2. 그래프 함수(고수준)
# 2.1 plot - type에 따라 여러 유형의 그래프를 그린다. default는 산점도 유형
# 3행 2열로 그래프영역을 분리하고 type 속성에 따른 그래프 출력
? par
oldPar <- par(mfrow = c(3,2))

plot(cars, type = "p", main = "p type") # 일반적 산점도
plot(cars, type = "l", main = "l type") # 추세선
plot(cars, type = "b", main = "b type") # 선과 점
plot(cars, type = "s", main = "s type") # 계단 형태
plot(cars, type = "n", main = "n type") # 안보임
plot(cars, type = "o", main = "o type") # 선과 점

par(oldPar)

plot(cars, main = "speed and stopping distance of cars", xlab = "speed(mph)",
     ylab = "stopping distance(ft)", las = 1) # las : 축, 눈금, 라벨 방향
                                              # 0 = 축과 평행, 1 = 가로, 2 = 축과 수직, 3 = 세로

# ※ 기능을 까먹었거나 모를때는 꼭 검색해보기 



























