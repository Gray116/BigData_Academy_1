#########################################
##### 6장. 데이터베이스 및 SQL 이용 #####
#########################################
# 이 장의 내용 : SQL문으로 데이터프레임과 DB(oracle, mySQL) 테이블을 이용
rm(list = ls(all.names = T))

### 1. SQL문으로 데이터 프레임 처리 ###
install.packages('sqldf')
library(sqldf) # sqldf 함수를 통해 데이터 프레임을 DB의 테이블처럼 사용가능

sqldf("select * from iris")

## 중복 행 제거(한 행만 출력) ##
sqldf("select distinct Species from iris")

## 행 제한 조건 (setosa종만 출력) ##
sqldf("select * from iris where Species == 'setosa'") # 방법1
iris[iris$Species == 'setosa', ] # 방법2
subset(iris, iris$Species == 'setosa') # 방법3
iris %>% filter(Species == 'setosa') # 방법4

## 컬럼명에 다른 기호가 들어가면 ``(숫자 1키 옆에 있음)로 묶은 후 출력 ##
ex <- sqldf("select `Sepal.Length`, Species from iris")
str(iris)
str(ex)

# ex. 종별 Sepal.Length, Sepal.Width의 평균을 조회
library(doBy)
summaryBy(Sepal.Length + Sepal.Width ~ Species,
          data = iris,
          FUN = mean)

sqldf("select Species, avg(`Sepal.Length`), avg(`Sepal.Width`)
      from iris
      group by Species
      having avg(`Sepal.Length`) > 6")

# ex2. iris를 Sepal.Length 기준으로 내림차순 정렬하여 11~15등을 조회
sqldf("select *
      from iris
      order by `Sepal.Length` desc
      limit 10,5")


### 2. 오라클 데이터베이스 연결 ###
# 사전 작업 : 'ojdb6.jar'를 이용하므로 자바 설치 및 환경변수 설정(JAVA_HOME) 필요!
getwd() # 작업 디렉토리에 'ojdb6.jar'
#              RJDBC 패키지를 설치 및 로드
install.packages('RJDBC')
library(RJDBC)
#              드라이버 클래스 로드
drv <- JDBC("oracle.jdbc.driver.OracleDriver", classPath = "ojdbc6.jar")
drv
#              데이터 베이스 연결
conn <- dbConnect(drv, "jdbc:oracle:thin:@127.0.0.1:1521:xe", "scott", "tiger")

# SQL문 전송 + 결과 받기
rs <- dbSendQuery(conn, "select *
                          from emp")
emp <- fetch(rs, n = 10) # 처음부터 10줄 받아옴, -1을 넣으면 전부 다 받아온다.
class(emp)

# SQL문 전송 + 결과받기 한번에 하는 방법
dept <- dbGetQuery(conn, "select *
                            from dept")
dept[dept$DEPTNO < 30, ]
colnames(dept) <- c('deptno', 'dname', 'loc')

# 데이터 연결 해제, 드라이버 언로드, 패키지 언로드
dbDisconnect(conn)
dbUnloadDriver(drv)
detach("package:RJDBC", unload = T)

# DB 데이터 수정
dbSendUpdate(conn, "insert into dept
                      values(50, 'IT', 'SEOUL')")
dbSendUpdate(conn, "update dept set
                      loc = 'PUSAN'
                      where deptno = 50")
dbSendUpdate(conn, "delete from dept
                      where deptno = 50")


### 3. MySQL 데이터베이스 연결 ###
# 사전작업 : 외부에서 액세스 허용, MySQL Workbench에서
# alter user 'root'@'localhost' identified with mysql_native_password by 'mysql';
install.packages("RMySQL")
library(RMySQL)
drv <- dbDriver("MySQL")
drv
# 데이터베이스 연결
conn <- dbConnect(drv, host = "127.0.0.1", dbname = "graydb", user = "root", password = "mysql")
conn

# SQL문 전송 및 결과 조회
rs <- dbSendQuery(conn, "select * from personal")
personal <- fetch(rs, n = -1)
personal

# SQL문 전송 및 결과 한 번에 조회
division <- dbGetQuery(conn, "select * from division")
division

# 테이블 전체 데이터를 한꺼번에 조회
person <- dbReadTable(conn, "personal")
person

# 데이터 베이스 연결 해제
dbDisconnect(conn)
dbUnloadDriver(drv)