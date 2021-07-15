#############################
##### 14장. 지도 시각화 #####
#############################
### 1. 정적 이미지 지도시각화 ###
install.packages('ggmap')
library(ggmap)

# 서울의 경도, 위도
seoul <- c(left = 126.77, right = 127.17, top = 37.70, bottom = 37.3)

# 객체 생성
? get_stamenmap
map <- get_stamenmap(seoul, zoom = 12, maptype = 'terrain')
ggmap(map)

pop <- read.csv('inData/population201901.csv', header = T)
View(pop)
str(pop)

library(stringr)

region <- pop$지역명
lon <- pop$LON # 위도
lat <- pop$LAT # 경도

pop$총인구수 <- gsub(',', '', pop$총인구수)
tot_pop <- as.numeric(pop$총인구수)

# 위의 데이터들로 데이터 프레임 생성
df <- data.frame(region, lon, lat, tot_pop)
df <- df[1:17, ]
View(df)

# 정적 지도 이미지 불러오기
daegu <- c(left = 123.4423013, right = 131.601445, top = 38.8714354, bottom = 32.828306)
map <- get_stamenmap(daegu, zoom = 7, maptype = 'terrain')
layer1 <- ggmap(map)
layer1

layer2 <- layer1 +
  geom_point(data = df, aes(x = lon, y = lat, col = factor(tot_pop),
                            size = factor(tot_pop)))
layer2

layer3 <- layer2 +
  geom_text(data = df, aes(x = lon, y = lat, label = region), size = 3, vjust = -1.1)
layer3


### 2. ggiraphExtra 패키지를 이용한 인터렉티브 지도 시각화 ###
## 2-1. 미국 주별 강력 범죄율 ##
# (1) 패키지 설치 및 로드
install.packages('ggiraphExtra') # 인터렉티브 지도 시각화를 위한 패키지
install.packages('mapproj') # ggChoropleth 함수 사용을 위한 패키지
install.packages('maps') # 지도 정보 이용
library(ggiraphExtra)
library(mapproj)
library(maps)
library(tibble)
library(ggplot2) # map_data('state')를 사용하면 미국 주별 위도,경도 데이터를 가져올 수 있다.

# (2) rownames 변수 설정
head(USArrests)
str(USArrests)

crime <- rownames_to_column(USArrests, var = 'state')
head(crime, 3)
map_data("state") # 미국내 주별 위도, 경도
crime$state <- tolower(crime$state)

# (3) 주별 위도, 경도 가져오기
state_map <- map_data('state')
view(state_map)

# (4) 지도 시각화
ggChoropleth(data = crime, # 지도에 표현할 데이터
             aes(fill = Murder, # 지도에 채워질 변수
                 map_id = state), # 지도에 나타날 지역
             map = state_map, # 위도, 경도 데이터
             interactive = T)


## 2-2. 대한민국 시도별 인구 구분도 시각화 ##
# (1) 패키지 설치 및 로드
install.packages('stringi')
install.packages('devtools')
devtools::install_github('cardiomoon/kormaps2014')

# https://cran.r-project.org/bin/windows/Rtools/ 에서 Rtools 설치하면 에러 수정된다.
library(kormaps2014)
View(kormap1) # 시도별 위도,경도
View(korpop1) # 2015년 센서스 데이터
              # korpop2 2015 - 시군구별 인구 데이터
              # korpop3 2015 - 읍면동별 인구 데이터
head(korpop1)

# kormap1$name의 인코딩 바꾸기 (글자 깨져있음)
library(stringi)
library(dplyr)
# kormap1$name <- iconv(kormap1$name, 'UTF-8', 'CP949')

head(korpop1[, c('name', 'pop', 'code')])
korpop1 <- rename(korpop1, pop = 총인구_명,
                  name = 행정구역별_읍면동)
korpop1$code






















