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
# 2-1. 미국 주별 강력 범죄율
# (1) 패키지 설치 및 로드
install.packages('ggiraphExtra') # 인터렉티브 지도 시각화를 위한 패키지
install.packages('mapproj') # ggChoropleth 함수 사용을 위한 패키지
install.packages('maps') # 지도 정보 이용용
library(ggiraphExtra)
library(mapproj)
library(maps)
library(tibble)

# (2)
head(USArrests)
str(USArrests)























































