##########################################
##### 10장. t-test분석 vs ANOVA 분석 #####
##########################################
### t-test 분석 ### 
# 두 그룹간의 평균 차이가 통계적으로 유의한지 검증

### ANOVA 분석 ###
# 세그룹 이상의 집단 간의 평균 차이가 유의한지 검증


## 1, 두 그룹간의 평균의 차이가 유의한지 분석
ToothGrowth
table(ToothGrowth$supp, useNA = "ifany")
# (1) 도표로 차이의 유의성을 표현 (tapply, by, summaryBy, aggregate 등을 이용해서 mean, sd)
# (2) 그래프로 시각화된 유의성을 표현 (바이올린 도표, 산점도, 상자 도표)
# (3) 통계적으로 유의한지 검증

## 비타민의 종류가 기니피그의 치아 성장에 영향을 미치는가?
dim(ToothGrowth)
ToothGrowth <- rbind(ToothGrowth, ToothGrowth)
head(ToothGrowth)
nrow(ToothGrowth)
table(is.na(ToothGrowth))
colSums(is.na(ToothGrowth)) # 열별 결측치 확인

# (1)
len.mean <- tapply(ToothGrowth$len, ToothGrowth$supp, FUN = mean)
len.mean

len.sd <- tapply(ToothGrowth$len, ToothGrowth$supp, FUN = sd)
len.sd

data.frame(len.mean, len.sd)

library(doBy)
summaryBy(len ~ supp, data = ToothGrowth, FUN = c(mean, sd))

# (2) 그래프 분석
library(dplyr)
ToothGrowth %>%
  group_by(supp) %>% 
  summarise(len.mean = mean(len)) %>% 
  ggplot(aes(x = supp, y = len.mean, fill = supp)) +
  geom_bar(stat = "identity", width = 0.5) +
  theme(legend.position = "none")

ggplot(data = ToothGrowth, aes(x = supp, y = len)) +
  geom_violin(aes(fill = supp)) +
  geom_boxplot(width = 0.4, aes(fill = supp), notch = T) +
  geom_point(position = "jitter", color = "orange", alpha = 0.4) +
  theme(legend.position = "none")

# (3) 통계적 분석
# 일원표본 t-test
a <- ToothGrowth[ToothGrowth$supp == 'OJ', 'len']
b <- ToothGrowth[ToothGrowth$supp == 'VC', 'len']
t.test(a, b)

# p-value가 0.05보다 작은 경우 : 귀무가설('두 그룹의 평균이 같다')을 기각한다.
# p-value가 0.05보다 큰 경우 귀무가설을 기각하지 못한다.

# 이원표본 t-test (등분산성 테스트 -> t-test)
var.test(len ~ supp, data = ToothGrowth)

# p-value가 0.05보다 작은 경우 : 귀무가설('두 그룹의 분산이 같다')을 기각한다.
#                                등분산성이 성립되지 않는다.
# p-value가 0.05보다 큰 경우 귀무가설을 기각하지 못한다.
#                                등분산성이 성립된다.
t.test(len ~ supp, data = ToothGrowth, var.equal = F)

rm(list = ls())
dim(ToothGrowth)
var.test(len ~ supp, data = ToothGrowth)
t.test(len ~ supp, data = ToothGrowth, var.equal = T) # 귀무가설 기각할 수 없음


## 예제1. 수면제 종류에 따라 수면량의 변화가 있는지 분석하시오.
# dataset::sleep - extra(수면량), group(수면제종류)
datasets::sleep
table(sleep$group, useNA = 'ifany')
dim(sleep)
sleep <- rbind(sleep, sleep)

# (1) 도표로 평균 차이 나타내기
summaryBy(extra ~ group, data = sleep, FUN = c(mean, sd))

# (2) 그룹간 차이를 시각화하기
sleep %>% 
  group_by(group) %>% 
  summarise(extra.mean = mean(extra)) %>% 
  ggplot(aes(x = reorder(group, -extra.mean), y = extra.mean, fill = group)) +
  geom_col(width = 0.5)

ggplot(sleep, aes(x = group, y = extra)) +
  geom_violin(width = 0.5) +
  geom_point(position = "jitter", col = 'coral', alpha = 0.7) +
  geom_boxplot(notch = T, width = 0.3)

# (3) 통계적으로 유의미한 차이를 분석하기
var.test(extra ~ group, data = sleep) # p-value가 0.05보다 커서 등분산성 성립
t.test(extra ~ group, data = sleep, var.equal = T) # p-value값에 의해 귀무가설 기각

# 귀무가설 (두 그룹간 평균이 같다)
# 대립가설 (두 그룹간 평균이 같지 않다)


## 2, 3개 이상의 그룹간의 평균의 차이를 비교할 때
# 분산분석 (ANOVA)
# (1) aov()
#   ex. iris 데이터 셋에서 종에 따라 Sepal.Length의 평균이 다른지 비교해보기
table(iris$Species)
result <- aov(Sepal.Length ~ Species, data = iris)
? aov
summary(result) # 2의 -16승이 나옴
#   F값이 0.05보다 작으면 귀무가설을 기각한다. (그룹간 평균이 같다)(통계적으로 유의적)
#   F값이 0.05보다 크면 귀무가설을 기각하지 않는다(통계적으로 비유의적).

# (2) anova()
#   ex. mtcars 데이터 셋에서 cyl에 따른 연비의 차이가 있는지 분석하시오.
str(mtcars$cyl)
table(mtcars$cyl)

fit <- lm(mpg ~ cyl, data = mtcars)
anova(fit) # 귀무가설을 기각(통계적으로 유의적이다) -> 대립가설을 채택한다

# 예제. Orange 데이터셋에서 오렌지나무의 나이에 따른 둘레의 차이가 있는지 분석하시오
datasets::Orange
head(Orange)
str(Orange)

fit <- lm(circumference ~ age, data = Orange)
fit
anova(fit)