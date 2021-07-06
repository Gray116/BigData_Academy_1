#################
### 중간 예제 ###
#################
# 문제1.
v1 <- c(1:10)
v2 <- v1 * 2
max_v <- max(v2)
min_v <- min(v2)
avg_v <- mean(v2)
sum_v <- sum(v2)

v3 <- v2[-5]

v1
v2
v3

# 문제2.
m1.seq <- seq(10, 38, 2)
m1 <- matrix(m1.seq, nrow = 3, ncol = 5, byrow = T)
m2 <- m1 + 100

m_max_v <- max(m1)
m_miv_v <- min(m1)

row_max <- apply(m1[, 1:5], 1, FUN = max)
col_max <- apply(m1[1:3, ], 2, FUN = max)

# 문제3.
( seq(1, 9, 2) )
( rep(1, 5) )
( rep(1:3, 3 ) )
( rep(1:4, each = 2) )

# 문제4.
v3 <- seq(1, 10, 3)
names(v3) <- c('A', 'B', 'C', 'D')
names(v3) <- LETTERS[1:4]

# 문제5.
week.korname <- c('일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일')

day_name <- function(count){
  count <- sample(c(1:100), 7, replace = F)
  names(count) <- week.korname
  max_day <- which.max(count)
  min_day <- which.min(count)
  cat(week.korname[max_day], ':', count[max_day], week.korname[min_day], ':', count[min_day],
      '\n')
  return(count)
}

day_name(count)

# 문제6.
m1 <- matrix(1:9, nrow = 3, ncol = 3)

n1 <- c(1, 2, 3)
n2 <- c(4, 5, 6)
n3 <- c(7, 8, 9)

( data.frame(n1, n2, n3) )

# 문제7.
m2 <- matrix(1:9, nrow = 3, ncol = 3, byrow = T)

# 문제8.
m3 <- matrix(1:9, nrow = 3, ncol = 3, dimnames = list(c('row1', 'row2', 'row3'), c('co1', 'co2', 'col3')), byrow = T)

# 문제9.
alpha <- matrix(c('a', 'b', 'c', 'd', 'e', 'f'), nrow = 2, ncol = 3)

alpha2 <- rbind(alpha, c('x', 'y', 'z'))
alpha3 <- cbind(alpha, c('s', 'p'))

# 문제10.
a <- array(1:24, dim = c(2,3,4))
a

a[2, 3, 4]
a[2, , ]
a[, 1, ]
a[, , 3]
a + 100
a[, , 4] * 100
a[1, 2:3, ]
a[2, , 2] <- a[2, , 2] + 100
a[, , 1] <- a[, , 1] - 2
a <- a * 10
rm(a)

# 문제11.
df1 <- data.frame(x = c(1, 2, 3, 4, 5), y = c(2, 4, 6, 8, 10))
df1 <- data.frame(x = c(1:5), y = seq(2, 10, 2))

# 문제12.
df2 <- data.frame(col1 = c(1:5), col2 = letters[1:5], col3 = c(6:10))

# 문제13.
제품명 <- c('사과', '딸기', '수박')
가격 <- c(1800, 1500, 3000)
판매량 <- c(24, 38, 13)

df3 <- data.frame(제품명, 가격, 판매량)

# 문제14.
apply(df3[2:3], 2, FUN = mean)

# 문제15.
name <- c('Potter', 'Elsa', 'Gates', 'Wendy', 'Ben')
gender <- factor(c('M', 'F', 'M', 'F', 'M'))
math <- c(85, 76, 99, 88, 40)

df4 <- data.frame(name, gender, math)
str(df4)

df4$stat <- c(76, 73, 95, 82, 35) # 파생변수만들기
df4$score <- df4$math + df4$stat

df4$grade <- ifelse(
  df4$score >= 150,
  'A',
  ifelse(df4$score >= 100),
  'B',
  ifelse(df4$score >= 70),
  'C',
  'X'
  )

# 문제16.
L1 <- list(name = 'scott', sal = 3000)
result1 <- L1$sal * 2
result1 <- L1[[2]] * 2

# 문제17.
L2 <- list('scott', c(100, 200, 300))

# 문제18.
L3 <- list(c(3, 5, 7), c('A', 'B', 'C'))
L3[[2]][1] <- 'Alpha'

# 문제19.
L4 <- list(alpha = 0.4, beta = sqrt(1:5), gamma = log(1:5))

( L4[1:3] )
# 문제20.
? unlist
L5 <- list(math=list(95, 90), writing=list(90, 85), reading=list(85, 80))

L5 <- unlist(L5)
mean(L5)

# 문제21.
class(iris)
str(iris)
dim(iris)
summary(iris)

# 문제22.
orderBy(~ -Petal.Length, data = iris)
iris[order(iris$Petal.Length, decreasing = T), ]

sort(iris$Sepal.Width, decreasing = T)

# 문제23.
table(iris$Species)

# 문제24.
( tapply(iris$Sepal.Length, iris$Species, FUN = sum, na.rm = T) )

# 문제25.
apply(iris[, -5], 2, mean)
lapply(iris[1:4], mean)
sapply(iris[1:4], mean)

( tapply(iris$Sepal.Length, iris$Species, FUN = mean, na.rm = T) )

# 문제26.
which.max(iris$Sepal.Length)
iris[which.max(iris$Sepal.Length), 'Species']