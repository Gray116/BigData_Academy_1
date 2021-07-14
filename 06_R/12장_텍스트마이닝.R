###############################
##### 12장. 텍스트 마이닝 #####
###############################
# 문자로 된 비정형 텍스트 데이터로부터 가치있는 정보를 얻어내는 분석
# 텍스트 마이닝에서 가장 먼저 할 일은 형태소 분석
install.packages("rJava")
install.packages("memoise")
 
# 1) R버전에 따라 설치가 안될 수 있다.
# 2) google에 CRAN - KoNLP를 검색하여 archive로 이동한다.
# 3) 그 중 최근에 업데이트가 된 것을 설치한다
# 4) 우측 package 탭에서 수동으로 insatll 하기 위해
install.packages("devtools")
# 5) KoNLP가 의존하는 package를 미리 설치해야 한다.
install.packages('hash')
install.packages('tau')
install.packages('Sejong')
install.packages('RSQLite')
# 6) scala-library-2.11.8.jar 파일을 C:/Program Files/R/R-4.1.0/library/KoNLP/java 폴더에 복사
library(KoNLP)
useNIADic() # 사전 설정하기, 에러가 발생하면 https://github.com/youngwoos/Doit_R/blob/master/FAQ/install_KoNLP.md 참조
extractNoun("대한민국의 영토는 한반도와 그 부속 도서로 한다.")


##### 1. 노래 가사 텍스트 마이닝 #####
# 1-1) 텍스트 마이닝 할 텍스트 로드(필요한 data 확보) 
txt <- readLines('inData/hiphop.txt') # 비정형 데이터
head(txt)
class(txt)
is.vector(txt)
length(txt)

# 1-2) 특수문자 제거하기(trim, 특수문자)
## gsub(oldStr, newStr, string) - string의 oldStr을 newStr로 변경한다.
? gsub
## str_replace & str_replace_all(string, oldStr, newStr) - string의 oldStr을 newStr로 변경한다.
library(stringr)

trim = function(str){
  return(gsub('^\\s+|\\s+$', '', str))
}

trim('               Hello            ')
temp <- gsub('\\W', ' ', txt) # 대문자W는 특수문자 제거

txt[864]
temp[864]

txt <- str_replace_all(txt, '\\W', ' ')
table(temp == txt)
length(txt)
head(txt)

# 1-3) 명사 추출
nouns <- extractNoun(txt)
class(nouns)
length(nouns)
nouns[[1]]
head(nouns)
length(unlist(nouns)) # 추출된 명사 개수 : 14416
table(unlist(nouns))

table(c('하나', '둘', '셋'))
wordcount <- table(unlist(nouns))
class(wordcount)
length(wordcount) # 반복된 명사를 제외한 명사의 갯수 : 3024개
sort(wordcount, decreasing = T)

library(dplyr)
df_word <- as.data.frame(wordcount, stringsAsFactors = F)
head(df_word)

df_word <- rename(df_word, word = Var1,
                  freq = Freq)
df_word$word <- trim(df_word$word)

## 한글자 이상의 단어만 추출
df_word <- df_word %>% 
  filter(nchar(word) > 1)

df_word <- filter(df_word, nchar(word) > 1)

## 단어 빈도표 만들기 (Top 20)
# top20 <- df_word[order(df_word$freq, decreasing = T), ]
top20 <- df_word[order(-df_word$freq), ][1:20, ]
top20

## 단어 빈도표를 그래프로 그리기
library(ggplot2)
ggplot(top20, aes(x = reorder(word, freq), y = freq)) +
  geom_col() +
  coord_flip() # x축과 y축이 바뀜

ggplot(top20, aes(x = freq, y = reorder(word, freq))) +
  geom_col() +
  geom_text(aes(label = freq), col = 'red', nudge_x = 2)

## 워드 클라우드
  # 1) 비정형 텍스트 데이터 확보
  # 2) 패키지 설치 및 로드 (KoNLP, wordcloud)
install.packages('wordcloud')
library(wordcloud)
display.brewer.all()
    # 2-1) 워드클라우드에 쓸 파레트 변수 설정
pal <- brewer.pal(9, 'Blues')[5:9]
    # 2-2) 난수 생성의 결과 일치시키기
set.seed(1234)
round(runif(6, min = 1, max = 45))
  # 3) 확보된 txt 데이터 읽어오기 (벡터 형태)
  # 4) 명사 추출
  # 5) 필요없는 데이터 삭제 (특수문자, zz, ㅋㅋ, ㅎㅎ, ...)
  # 6) 워드 클라우드 생성 (dataframe)
  # 7) wordcloud함수를 이용해서 워드클라우드 생성
wordcloud(words = df_word$word, freq = df_word$freq, # 단어와 빈도수 설정
          min.freq = 2, max.words = 200, # 최소, 최대한의 단어 빈도수
          random.order = F, # 최다 빈도수의 단어가 중앙에 배치
          rot.per = 0.1, scale = c(4, 0.3), # 회전 단어 비율 및 단어 크기 범위
          colors = pal)


##### 2. 국정원 트위터 데이터 #####
rm(list = ls(all.names = T))

library(KoNLP)
library(wordcloud)
library(stringr)
library(dplyr)
library(ggplot2)

twitter <- read.csv('inData/twitter.csv', header = T,
                    stringsAsFactors = F, fileEncoding = 'utf-8')
View(twitter)

twitter <- rename(twitter, no = 번호, id = 계정이름, date = 작성일, tw = 내용)
# 필요없는 문자 삭제
twitter$tw <- str_replace_all(twitter$tw, '\\W', ' ')
twitter$tw <- str_replace_all(twitter$tw, '[ㄱ-ㅎ]+', ' ')

# 명사 추출
class(twitter$tw)
nouns <- extractNoun(twitter$tw)

# 워드 카운트 생성
wordcount <- table(unlist(nouns))
head(sort(wordcount, decreasing = T))

length(unlist(nouns)) # 추출된 명사 수 : 84,957개
length(wordcount) # 중복제거한 명사 수 : 10,186개

df_word <- as.data.frame(wordcount, stringsAsFactors = F)
str(df_word)
df_word <- rename(df_word, word = Var1, freq = Freq)

# 단어 중 두글자 이상만 분석
df_word <- filter(df_word, nchar(word) > 1)

# 최빈 단어 top 20 그래프
top20 <- df_word[order(-df_word$freq), ][1:20, ]

ggplot(top20, aes(x = freq, y = reorder(word, freq))) +
  geom_bar(stat = 'identity') +
  geom_text(aes(label = freq), hjust = 1.5, col = 'orange')

# 워드 클라우드
set.seed(1234)
pal <- brewer.pal(8, "Dark2")

wordcloud(words = df_word$word, freq = df_word$freq,
          min.freq = 5, max.words = 200, random.order = F,
          rot.per = 0.1, scale = c(6, 0.3), colors = pal)

# 게시글의 횟수가 150회 이상인 데이터에 대해 시각화
idCount <- as.data.frame(table(twitter$id))
str(idCount)
idCount <- rename(idCount, id = Var1)
idCount <- rename(idCount, count = Freq)

twitter <- left_join(twitter, idCount, by = 'id')
twitter1 <- subset(twitter, count>150)

head(twitter1)

# 필요없는 문자 삭제
# 명사 추출
nouns <- extractNoun(twitter$tw)

# 워드 카운트
wordcount <- table(unlist(nouns))
df_word <- as.data.frame(wordcount, stringsAsFactors = F)
df_word <- rename(df_word, word = Var1, freq = Freq)
df_word <- filter(df_word, nchar(word) > 1)

head(df_word)

wordcount(words = df_word$word, freq = df_word$freq,
          min.freq = 5, max.words = 200, random.order = F,
          rot.per = 0.1, scale = c(2, 0.2), colors = pal)