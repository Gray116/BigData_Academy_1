##############################
##### 8장. 데이터 시각화 #####
##############################
### 시각화 개요 : 원본 데이터나 분석된 결과 데이터를 그래프로 표현
## 1. R의 그래픽 시스템 ##
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


## 1.1 그래프 함수
# 고수준 함수 - plot, barplot, boxplot, hist, pie, ...
#               그래픽 창을 새롭게 열어 그래프를 그릴 수 있게 해주는 함수
# 저수준 함수 - lines, abline, point, text
#               열려있는 그래픽 창에 점, 화살표, 선과 같이 부수적인 요소를 추가


## 1.2 그래프 파라미터
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


## 2. 그래프 함수(고수준) ##
# 2.1 plot - type에 따라 여러 유형의 그래프를 그린다. default는 산점도 유형
# ※ 기능이 많아 모를 땐 검색해서 천천히 읽어보자
# 3행 2열로 그래프영역을 분리하고 type 속성에 따른 그래프 출력
? par
oldPar <- par(mfrow = c(2,3)) 

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

# 2.2 barplot - 막대그래프
# ex1.
datasets::VADeaths
class(VADeaths)
rownames(VADeaths)
colnames(VADeaths)

barplot(VADeaths, main = "버지니아 사망률", font = 2, # font : 1이 default, 2는 bold, 3은 italic,
        border = "red", legend = rownames(VADeaths),  # 4는 (bold + italic)
        density = 50, angle = c(10, 30, 50, 70, 120), # legend : 오른쪽 상단 범례  
        col = c("brown", "azure", "pink", "skyblue", "coral")) 
                                                      # destiny : 막대그래프 안에 칠할 선의 수
                                                      # angle : 빗금 각도

barplot(VADeaths, main = "버지니아 사망률", font = 2, border = "orange",
        legend = rownames(VADeaths), density = 60, angle = c(10,30,50,70,110),
        beside = T, col = rainbow(5))                 # beside : 막대선을 분리
                                                      # col에는 R에서 제공되는 파레트 함수 사용가능

# ex2.
install.packages("RColorBrewer") # 팔레트 함수
library(RColorBrewer)
display.brewer.all()

pal <- brewer.pal(5, "Accent")

barplot(VADeaths, main = "버지니아 사망률", font = 2, border = "orange",
        legend = rownames(VADeaths), density = 60, angle = c(10,30,50,70,110),
        beside = T, col = pal)

# 2.3 boxplot - 상자그림(상자도표, 사분위수, 그래프)
# ex1.
datasets::InsectSprays
class(InsectSprays)
names(InsectSprays) <- c('cnt', 'spray')
rm(InsectSprays)
head(InsectSprays)

boxplot(count ~ spray, data = InsectSprays, col = pal)

tapply(InsectSprays$count, InsectSprays$spray, summary)
by(InsectSprays$count, InsectSprays$spray, summary)
library(doBy)
summaryBy(count ~ spray, data = InsectSprays, FUN = summary)

# 2.4 hist - 히스토그램(도수분포표 - 연속된 데이터의 도수분포)
# ex1.
x <-c(1,1,2,2,2,3,4,4)
hist(x)
hist(x, breaks = c(0.5, 1.5, 2.5, 3.5, 4.5)) # breaks : 구간을 임의로 지정 가능
hist(x, breaks = c(1, 2, 3, 4, 5, 6))

h <- hist(x, breaks = c(0.5, 1.5, 2.5, 3.5, 4.5), ylim = c(0, 3.5))
h

text(h$mids, h$counts, paste(h$counts, '개', sep = ''), col = "red", adj = c(0.5, -0.5))

text(h$mids, h$counts, paste(h$counts, '개', sep = ''), col = "blue", adj = c(0,0)) # 텍스트의 왼쪽 아래가 기준점
text(h$mids, h$counts, paste(h$counts, '개', sep = ''), col = "orange", adj = c(0,1)) # 텍스트의 왼쪽 위가 기준점
text(h$mids, h$counts, paste(h$counts, '개', sep = ''), col = "green", adj = c(1,0)) # 텍스트의 오른쪽 아래가 기준점
text(h$mids, h$counts, paste(h$counts, '개', sep = ''), col = "purple", adj = c(1,1)) # 텍스트의 오른쪽 위가 기준점

# ex2.
datasets::islands
class(islands)
is.vector(islands)

hist(sqrt(islands), breaks = c(2, 30, 70, 100, 140))

set.seed(14)
x <- rnorm(1000) # 평균이 0, 표준편차가 1인 데이터 1000개 픽
hist(x)

# 2.5 pie - 파이 그래프
# ex1.
x <- c(20, 30, 30, 20, 15, 5)
pie.lang <- x/sum(x)
pie.lang
pie.lang <- c(0.1, 0.3, 0.2, 0.15, 0.1, 0.15)
sum(pie.lang)

names(pie.lang) <- c('c', 'java', 'python', 'R', 'oracle', 'Hadoop')
pie(pie.lang, col = pal) # 반시계 방향
pie(pie.lang, clockwise = T, col = rainbow(6)) # 'c'부터 시계방향으로 나열
pie(pie.lang, clockwise = T, col = brewer.pal(6, "Set3"))

# 2.6 mosaicplot - 모자이크 플롯
# ex1.
datasets::Titanic
class(Titanic)
dim(Titanic)
mosaicplot(~ Class+Sex+Age+Survived, data = Titanic, color = T)


## 3. 그래프 함수(저수준) ##
# 3.1 points
# ex1.
plot(-4:4, -4:4, type = "p")
points(rnorm(100), rnorm(100), pch = 8, col = 'brown')

# 3.2 lines
# ex1.
head(cars)
plot(cars$speed, cars$dist)

fit <- lm(dist ~ speed, data = cars)
fit

lines(cars$speed, cars$speed * 3.932 - 17.579, col = 'blue', lty = 'dashed',
      lwd = 2)

# 3.3 abline - 회귀식 선
# ex1.
abline(fit, col = 'red', lwd = 4, lty = 'dotted')

# 3.4 text(x, y, 출력할 텍스트, 그 외 옵션들)
# ex1.
plot(-1:1, -1:1, type = "n", xlab = "X", ylab = "Y", las = 1)
points(0, 0, pch = 3, cex = 4, lwd = 3)

text(0, 0, "hello")
text(0, 0, "red", col = "red", font = 2, cex = 2, adj = c(0, 0)) # cex : 글씨 크기
text(0, 0, "blue", col = "blue", font = 2, cex = 3, adj = c(1, 0))
text(0, 0, "coral", col = "coral", font = 2, cex = 4, adj = c(1, 1))
text(0, 0, "green", col = "green", font = 2, cex = 4, adj = c(0, 1))

# ex2.
plot(1:5, 1:5, type = "n", las = 1)

text(3, 3, 'A', adj = c(0,0), col = 'red')
text(1.5, 4, expression(hat(beta) == (X^t)*X ^ {-1} * X^t*y) ,adj = c(0,0))


## 4. ggplot2 ##
# 순서1. 그래프 초기화(데이터 셋, 변수 설정)
#     ggplot 자체로는 그래프 표현을 할 수 없다.
# 순서2. 그래프 결과물에 대응하는 geom함수
# 순서3. 부가요소를 추가하는 함수
# 순서4. + 기호를 이용하여 함수들을 연결하는 방식으로 그래프 생성

install.packages("ggplot2")
library(ggplot2)

# ggplot(data, aes(x = , y = )) +
#   geom함수(어떤 그래프를 그릴지) + 
? aes
#   labs(제목, x축, y축 label, 서브제목, 출처) +
#   scale함수() +
#   theme() +
#   coord_cartesian()

ggplot(data = mtcars, aes(x = wt, y = mpg)) +
  geom_point(aes(size = wt, col = cyl)) +
  labs(title = "wt & mpg", subtitle = "(차량 무게와 연비와의 관계",
      x = "weight(1,000lbs)", y = "Fuel consumption(miles per gallon",
      catpion = "source : mpg datasets") +
  geom_smooth()

# 4.1 산점도, 적합도
# ex1. x축에 Sepal.Length, y축에 Petal.Width의 산점도(점의 색은 종에 따라 다르게 표기)
ggplot(iris, aes(x = Sepal.Length, y = Petal.Width)) +
  geom_point(aes(col = Species)) +
  scale_color_manual(values = c('black', 'red', 'orange')) +
  labs(title = "iris 데이터의 산점도",
       x = "꽃잎 길이", y = "꽃잎 넓이") +
  coord_cartesian(ylim = c(0, 2.25)) + # y축을 2.25까지만 표기
  geom_smooth(method = "lm")

# 연습문1. airquality$Ozone과 airquality$Solar의 산점도(월별로 색상을 다르게)출력
table(airquality$Month)
airquality$Month <- as.factor(airquality$Month)
str(airquality$Month)

ggplot(airquality, aes(x = Solar.R, y = Ozone)) +
  geom_point(aes(col = Month)) +
  labs(title = "Ozone과 Solar의 관계", x = "태양", y = "오존") +
  scale_color_manual(values = rainbow(5)) # month의 구조가 팩터가 아니면 변경 불가

# 연습문2. mtcars의 데이터에서 wt와 mpg의 관계 나타내기
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(shape = 21, color = 'blue', bg = 'coral', size = 2,
             stroke = 2) +
  geom_smooth(method = "loess", col = 'red', lwd = 2, lty = 'dashed') +
  geom_text(label = rownames(mtcars), hjust = 0, vjust = 0, # vjust : (0위, 1아래)
            nudge_y = 0.5, size = 2) +                      # hjust : (0우, 1좌)
  labs(title = "차량 무게와 연비와의 관계", subtitle = "(부제목)",
       x = "차량무게(1,000lbs)", y = "연비", caption = "출처 : datasets::mtcars")

? geom_text

# 4.2 히스토그램 : 연속형 자료형에서의 도수분포표
#                  범주형 도수분포는 불가하다.
mtcars$mpg
cat(min(mtcars$mpg), max(mtcars$mpg))

ggplot(mtcars, aes(x = mpg)) +
  geom_histogram()

# 연습문1. 실린더(cyl)별 히스토그램 그려보기
table(mtcars$cyl)

ggplot(mtcars, aes(x = mpg)) +
  geom_histogram() +
  facet_grid(cyl ~ .)

mtcars$cyl <- factor(mtcars$cyl, levels = c(4, 6, 8),
                     labels = c('4 cylinders', '6 cylinders', '8 cylinders'))
head(mtcars)

ggplot(mtcars, aes(x = mpg)) + # 범주형 데이터가 오면 에러 발생
  geom_histogram() +
  facet_grid(cyl ~ .) +
  labs(title = "실린더 별 연비 히스토그램")

# 연습문2. mpg의 displ의 도수분포표 그려보기
#          class에 따라 색상을 다르게 표현
#   빈(bin)의 갯수를 지정하지 않으면 30
str(mpg$displ)

ggplot(mpg, aes(x = displ, fill = class)) +
  geom_histogram(bins = 20, binwidth = 0.2) +
  theme(legend.position = "bottom", axis.text.x = element_text(color = 'red', size = 8),
        axis.line = element_line(color = 'black'),
        axis.text.y = element_blank(), panel.background = element_rect(fill = 'lightblue', linetype = 'dotted',
                                                                       color = 'black'),
        plot.background = element_rect(fill = 'lightyellow'))

# 4.3 상자도표(boxplot)
boxplot(iris$Sepal.Length)$stat

# ex1. 전체 데이터에 대해 Sepal.Length의 boxplot
ggplot(iris, aes(y = Sepal.Length, fill = 'coral')) +
  geom_boxplot()

# ex2. 종별 Sepal.Length의 boxplot
ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) +
  geom_boxplot() +
  theme(legend.position = "top",
        panel.background = element_rect(fill = 'lightblue'),
        axis.line = element_line(colour = 'black'))

# ex3. 대륙(continent)별 GDP의 차이 확인해보기
# gapminder::gapminder 사용
install.packages("gapminder")
library(gapminder)
dim(gapminder)
table(is.na(gapminder))
str(gapminder)
head(gapminder)

temp <- gapminder[gapminder$continent == 'Asia', ]

ggplot(gapminder, aes(x = continent, y = gdpPercap)) +
  geom_boxplot(aes(fill = continent)) +
  coord_cartesian(ylim = c(0, 90000)) +
  theme(legend.position = "top",
        panel.background = element_rect(fill = 'lightblue'),
        axis.text = element_text(angle = 45, vjust = 0.5))

# ex4. car::salaries에서 교수의 직급(rank)별 연봉(salary)의 상자도표
install.packages('car')
library(car)
library(ggplot2)
dim(Salaries)
ggplot(Salaries, aes(x = rank, y = salary, col = rank)) +
  geom_boxplot(fill = 'lightyellow',notch = TRUE) + # notch : 중위수에 대해 95% 신뢰구간을 표현
  geom_point(position = 'jitter', alpha = 0.3, color = 'brown', pch = 20) +
  geom_rug(sides = 'l', col = 'dimgray') # rug : 관측 값의 밀도 상태를 축에 표현

# 연습문1. mtcars데이터에서 cyl개수에 따른 연비(mpg)의 95% 중위수 신뢰구간을 시각화하시오.
datasets::mtcars
dim(mtcars)

ggplot(mtcars, aes(x = cyl, y = mpg, fill = cyl)) +
  geom_boxplot(notch = T)

# 4.4 바이올린 도표
# boxplot과 밀도 도표를 합쳐 놓은 방식
# ex1. 합창부 단원의 키와 성악부 part의 관계
lattice::singer
singer <- lattice::singer

ggplot(singer, aes(x = voice.part, y = height)) +
  geom_violin(fill = "honeydew2") +
  geom_boxplot(width = 0.3, fill = "green") +
  geom_point(position = 'jitter', alpha = 0.5, col = "orange")

# 4.5 밀도 도표
rm(mtcars)
str(mtcars)
# 실린더(cyl)수에 따른 연비를 밀도 도표로 나타내보기
mtcars$cyl = factor(mtcars$cyl, levels = c(4, 6, 8), labels = c('4 cyl', '6 cyl', '8 cyl'))
ggplot(mtcars, aes(x = mpg)) +
  geom_density(aes(fill = cyl)) +
  theme(legend.position = c(0.9, 0.8))

# 4.6 추세선 (시계열에서 데이터의 흐름을 표현)
dim(economics)
head(economics)
# 시간(date)에 따른 실업률(unemploy)의 추세선
ggplot(economics, aes(x = date, y = unemploy)) +
  geom_line() +
  geom_smooth(method = "lm") # 적합도선

# 4.7 막대그래프(geom_bar() 함수, geom_col() 함수)
#     도수분포표 시각화 : 히스토그램(연속데이터), 막대그래프(범주형데이터)
#     히스토그램(geom_histogram()) : 연속된 자료를 계급으로 나누어, 계급별 도수를 나타낸다
#     geom_bar() : 범주형 데이터의 빈도를 나타낸다.
#     geom_col() : x, y축이 다 존재할 경우 (geom_bar()함수도 사용할 수 있음)
library(ggplot2)
table(mpg$manufacturer)
? geom_bar

ggplot(mpg, aes(x = manufacturer)) +
  geom_bar(stat = "count") +
  theme(axis.text.x = element_text(angle = 60, vjust = 0.8))

# ex1. 제조회사별 막대그래프 (class별로 다른 색상 적용)
library(RColorBrewer)
ggplot(mpg, aes(x = manufacturer, fill = class)) +
  geom_bar(stat = "count") +
  theme(legend.position = "top",
        axis.text.x = element_text(angle = 60, vjust = 0.8)) +
  labs(title = "제조회사별 빈도", subtitle = "(class별 분리)",
       x = "제조회사", y = "빈도수", caption = "soucre:ggplot2::mpg") +
  scale_fill_manual(values = brewer.pal(7, "Set3")) +
  scale_color_manual(values = brewer.pal(7, "Set3")) +
  coord_cartesian(ylim = c(0, 50))

# ex2. 절단품질(cut)별 빈도수
diamonds <- ggplot2::diamonds

ggplot(diamonds, aes(x = cut)) +
  geom_bar(stat = "count", aes(fill = cut))

# ex3. 절단품질(cut)별 색상(color)의 빈도수
library(ggplot2)
library(dplyr)
head(diamonds)

diamonds %>% group_by(cut, color) %>% 
  summarise(cnt = n()) %>% 
  ggplot(aes(x = cut, y = cnt, fill = color)) +
  geom_bar(stat = "identity", position = "dodge") + # position(= beside=T) : 막대 개별 분할
  # geom_col(position = "dodge")
  theme(legend.position = "bottom")

# ex4. cut별 table(다이아몬드 상단 넓이) 갯수 시각화(title 가운데 정렬)
table(diamonds$cut, diamonds$table)

diamonds %>% 
  group_by(cut, table) %>% 
  summarise(n = n()) %>%
  group_by(cut) %>%
  summarise(cnt = n()) %>% 
  ggplot(aes(x = cut, y = cnt, fill = cut)) +
  geom_bar(stat = "identity") +
  labs(title = "다이아몬드 품질별 다이아몬드 상단 넓이 종류 수",
       subtitle = "cut별 테이블 수") +
  theme(legend.position = "bottom", plot.title = element_text(hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5))

# ex5. cut별 table별 빈도수 시각화 (cut, table 각각 따로)
table(diamonds$cut, diamonds$table)

diamonds %>% 
  group_by(cut, table) %>% 
  summarise(n = n()) %>% 
  ggplot(aes(x = table, y = n)) +
  geom_bar(stat = "identity") +
  facet_wrap(~ cut) + # cut의 각각의 레벨별로
  coord_cartesian(ylim = c(0, 5000), xlim = c(50, 80))

# 4.8 그래프를 파일로 저장
# (1) basic graph, ggplot 패키지(모두 저장가능)
jpeg("iris.jpg", width = 400, height = 400)
boxplot(iris$Sepal.Length)
dev.off()

getwd()

png("outData/iris.png", width = 300, height = 150) # 1. 파일을 생성
ggplot(iris, aes(x = Petal.Length, y = Petal.Width)) + # 2. 그래프를 입력
  geom_point() +
  facet_wrap(~ Species)
dev.off() # 3. 저장 및 닫기
# (2) ggplot2 패키지 - 그래프 함수에서만 저장할 수 있는 방법
ggplot(iris, aes(x = Petal.Length, y = Petal.Width, col = Species)) +
  geom_point(aes(size = Petal.Width), pch = 2, alpha = 0.5)
ggsave('outData/iris.jpg')

# 4.9 그래프 합치기
install.packages("gridExtra")
library(gridExtra)

g1 <- ggplot(iris, aes(x = Petal.Length, y = Petal.Width)) +
  geom_point()
g1

g2 <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point()
g2

grid.arrange(g1, g2, ncol = 2, nrow = 1)


## 5. 산점도 행렬 ##
plot(iris[-5])
pairs(iris[-5], panel = panel.smooth)