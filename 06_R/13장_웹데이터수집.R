################################################
##### 13장. 웹 데이터 수집 (정적 웹크롤링) #####
################################################
# 패키지 설치 확인 및 로드
installed.packages()
install.packages("rvest")
library(rvest)

# 해당 사이트에서 url을 가져와 변수에 벡터로 저장하기
url <- 'https://movie.naver.com/movie/point/af/list.nhn?&page=1'
html <- read_html(url, encoding = 'utf-8')

# 영화제목 : < .movie(.color_b) >
nodes <- html_nodes(html, '.movie')
as.character(nodes)
title <- html_text(nodes)

# 해당 영화 안내 페이지
movie_info <- html_attr(nodes, 'href')
movie_info <- paste0(url, movie_info)
head(movie_info)

# 평점 : < .list_netizen_score em >
nodes <- html_nodes(html, '.list_netizen_score em')
movie_point <- html_text(nodes)

# 영화 리뷰 : td.title
nodes <- html_nodes(html, 'td.title')
text <- html_text(nodes)
text

? gsub
text <- gsub('\t','', text)
text <- gsub('\n', '', text)
text

review <- unlist( strsplit(text, '중[0-9]{1,2}') )[seq(2, 20, 2)] # 0~9까지가 1개 혹은 두개
review <- gsub('신고', '', review)
review

# 데이터 프레임으로 만들기
df <- data.frame(title, movie_info, movie_point, review)
View(df)

page <- cbind(title, movie_info)
page <- cbind(page, movie_point)
page <- cbind(page, review)
View(page)

write.csv(df, file = 'outData/movie_review.csv')


### 여러 페이지 정적 웹 크롤링 (영화리뷰 1~100페이지까지) ###
home <- 'https://movie.naver.com/movie/point/af/list.nhn'
site <- 'https://movie.naver.com/movie/point/af/list.nhn?&page='
movie.review <- NULL

for (i in 1:100) {
  url <- paste0(site, i)
  print(url)
  html <- read_html(url, encoding = 'utf-8')
  
  # 영화제목 : < .movie(.color_b) >
  nodes <- html_nodes(html, '.movie')
  title <- html_text(nodes)
  
  # 해당 영화 안내 페이지
  movie_info <- html_attr(nodes, 'href')
  movie_info <- paste0(home, movie_info) # for문을 돌릴 때는 변수 확인 필수
  
  # 평점 : < .list_netizen_score em >
  nodes <- html_nodes(html, '.list_netizen_score em')
  movie_point <- html_text(nodes)
  
  # 영화 리뷰 : td.title
  nodes <- html_nodes(html, 'td.title')
  text <- html_text(nodes)

  text <- gsub('\t','', text)
  text <- gsub('\n', '', text)
  
  review <- unlist( strsplit(text, '중[0-9]{1,2}') )[seq(2, 20, 2)] # 0~9까지가 1개 혹은 두개
  review <- gsub('신고', '', review)
  
  # 데이터 프레임으로 만들기
  df <- data.frame(title, movie_info, movie_point, review) # 한페이지에 4열 10행이 생성된다.
  movie.review <- rbind(movie.review, df)
}

write.csv(movie.review, file = 'outData/naver_movie.csv')

# 영화 리뷰의 내용만 선택하여 최빈 단어 10개를 뽑아 워드클라우드
library(KoNLP)
library(stringr)
library(dplyr)
library(ggplot2)
library(wordcloud)

movie <- movie.review
str(movie)
movie$movie_point <- as.numeric(movie$movie_point)

result <- movie %>%
  group_by(title) %>% 
  summarise(point.mean = mean(movie_point),
            point.sum = sum(movie_point),
            n = n()) %>%
  filter(n > 10) %>% 
  arrange(desc(point.mean), desc(point.sum)) %>% 
  head(10)

result
ggplot(result, aes(x = point.mean, y = reorder(title, point.mean))) +
  geom_col(aes(fill = title), width = 0.7) +
  theme(legend.position = 'none') +
  geom_text(aes(label = paste('점수 총점:', point.sum, ', 점수 평균', round(point.mean),1)), hjust = 1.1)

# 평균평점이 높은 영화의 최빈 단어 및 워드 클라우드 생성하기
result$title
movie1 <- movie %>% # result title에 있는 영화만 추출할 예정
  filter(title %in% result$title)
nrow(movie1)

useNIADic()

# 특수문자 없애기
movie1$review <- gsub('\\W', ' ', movie1$review)
movie1$review <- gsub('[ㄱ-ㅎㅏ-ㅣ]', ' ', movie1$review)

head(movie$review)

# 명사 추출하기
nouns <- extractNoun(movie$review)

# 워드 카운트
wordcount <- table(unlist(nouns))

df_word <- as.data.frame(wordcount, stringsAsFactors = F)
df_word <- rename(df_word, word = Var1, freq = Freq)
df_word <- filter(df_word, nchar(word) > 1 & word != '영화')

# 최빈단어 10개 뽑기
top10 <- df_word[order(df_word$freq, decreasing = T), ][1:10, ]
top10

display.brewer.all()
pal <- brewer.pal(8, 'Dark2')

wordcloud(words = df_word$word, freq = df_word$freq,
          min.freq = 5, max.words = 150,
          random.order = F, colors = pal,
          rot.per = 0.1, scale = c(4, 0.3))