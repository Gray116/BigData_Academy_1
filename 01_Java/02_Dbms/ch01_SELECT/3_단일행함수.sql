--   ★ 단일행 함수, 내장 함수
--          함수 = 단일행 함수 + 그룹 함수(집계 함수)
SELECT HIREDATE, TO_CHAR(HIREDATE, 'YY-MM-DD')
    FROM EMP;

SELECT HIREDATE, TO_CHAR(HIREDATE, 'YY"년"MM"월"DD"일"')
    FROM EMP;

SELECT ENAME, INITCAP(ENAME)
    FROM EMP;
    
SELECT SUM(SAL) -- 집계 함수
    FROM EMP;

--  부서번호 별 합계
SELECT DEPTNO, SUM(SAL)
    FROM EMP
    GROUP BY DEPTNO;
    


--      숫자, 문자, 날짜, 형변환함수, NVL 
--  1. 숫자 함수
--      DUAL 테이블 : 오라클에서 기본적으로 제공 (1행 1열)
--   1) ABS, FLOOR, TRUNC
SELECT *
    FROM DUAL;

SELECT ABS(-9)
    FROM DUAL;

SELECT  FLOOR(34.5678)
    FROM DUAL;

SELECT FLOOR(34.5678*100)/100
    FROM DUAL;
    
SELECT TRUNC(34.5678) -- 소수점 첫째 자리에서 버림, DEFAULT = 1
    FROM DUAL;

SELECT TRUNC(34.5678, 1) -- 소수점 둘째자리에서 내림
    FROM DUAL;

SELECT TRUNC(34.5678, 2)
    FROM DUAL;

SELECT TRUNC(34.5678, -1)
    FROM DUAL;
    
--  EMP 테이블에서 이름, 급여(십의 자리에서 내림) 
SELECT ENAME, SAL, TRUNC(SAL, -2)
    FROM EMP;
    
--  2) CEIL, ROUND
SELECT CEIL(34.5678) -- 소수 첫째자리에서 올림
    FROM DUAL;
    
SELECT ROUND(34.5678) -- 소수 첫째자리에서 반올림
    FROM DUAL;
    
SELECT ROUND(34.5678, 2) -- 소수 N+1자리에서 반올림
    FROM DUAL;

SELECT ROUND(34.5678, -1) -- 일의자리에서 반올림
    FROM DUAL;
    
--  3) MOD
SELECT MOD(9,2) -- 연산의 나머지를 출력
    FROM DUAL;
    
SELECT MOD('9',2)
    FROM DUAL;
    
--  홀수년도에 입사한 사원의 모든 정보
SELECT *
    FROM EMP
    WHERE MOD(TO_CHAR(HIREDATE, 'RR'), 2) = 1;



--  2. 문자 함수
--   1) UPPER, LOWER, INITCAP
SELECT UPPER('acbcd')
    FROM DUAL;
    
SELECT LOWER('adsdfADFAD')
    FROM DUAL;
    
SELECT INITCAP('WELCOME') -- 첫번째 글자만 대문자로
    FROM DUAL;
    
--      JOB이 MANAGER인 직원의 모든 필드
SELECT *
    FROM EMP
    WHERE UPPER(JOB) = 'MANAGER';
    
--      이릉이 SCOTT인 직원의 모든 필드
SELECT *
    FROM EMP
    WHERE INITCAP(ENAME) = 'Scott';

--   2) CONCAT
--      CONCAT 하나에 두 문자열씩만 가능
SELECT 'AB'||'CD'
    FROM DUAL;
    
SELECT CONCAT('AB','CD')
    FROM DUAL;

--      XXX는 XX다(SCOTT은 JOB이다)
SELECT ENAME||'은(는) '||JOB||'이다'
    FROM EMP;
    
SELECT CONCAT(CONCAT(ENAME, '은(는) '), CONCAT(JOB, '이다.'))
    FROM EMP;

--   3) SUBSTR(str, 시작위치, 추출할 갯수), 첫번째 위치가 1, 시작위치는 음수 가능
--      SUBSTRB(str, 시작바이트위치, 문자바이트수)
SELECT SUBSTR('ORACLE', 3, 2)
    FROM DUAL;
    
SELECT SUBSTRB('ORACLE', 3, 2)
    FROM DUAL;
    
SELECT SUBSTR('데이터베이스', 4, 2)
    FROM DUAL;
--      네번째 글자부터 2바이트 추출
--      영어는 한글자가 1바이트, 한글은 3바이트
SELECT SUBSTRB('데이터베이스', 4, 6)
    FROM DUAL;    
    
SELECT SUBSTR('WECOME TO ORACLE', -6, 3)
    FROM DUAL;
    
SELECT SUBSTR(123, 2, 1)
    FROM DUAL;
    
--      9월에 입사한 사원의 모든 필드 81/09/01
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';

SELECT *
    FROM EMP
    WHERE SUBSTR(HIREDATE, 4,2) = '09';

--      9일에 입사한 사원의 모든 필드
SELECT *
    FROM EMP
    WHERE SUBSTR(HIREDATE, -2, 2) = '09';
    
--   4) LENGTH
SELECT LENGTH('ABCD')
    FROM DUAL;

SELECT LENGTHB('ABCD')
    FROM DUAL;

SELECT LENGTH('오라클')
    FROM DUAL;

--      한 글자당 3바이트
SELECT LENGTHB('오라클')
    FROM DUAL;
    
--   5) INSTR(STR, 찾을 글자), INSTR(STR, 찾을 글자, 시작 위치)
--      STR에서 찾을 글자의 '위치 = 5'를 리턴
SELECT INSTR('ABCABC', 'B', 3)
    FROM DUAL;

--      세번째 글자위치부터 시작해서 처음나오는 B의 위치
--      -3이면 뒤에서 세번째 글자부터 시작해서 앞으로 찾아감
SELECT INSTR('ABCABCABC', 'B', -3)
    FROM DUAL;
    
--      9월에 입사한 사원(INSTR을 이용)
SELECT *
    FROM EMP
    WHERE INSTR(HIREDATE, '09', 4) = 4;
    
--      9일에 입사한 사원
SELECT *
    FROM EMP
    WHERE INSTR(HIREDATE, '09', 6) = 7;
    
--      9일이 아닌 다른 날에 입사한 사원
SELECT *
    FROM EMP
    WHERE INSTR(HIREDATE, '09', 6) = 0;
    
--   6) LPAD, RPAD
--      LPAD(STR, 자릿수설정, 채울문자) : STR을 자리수만큼 확보하고 왼쪽 빈자리에 채울문자 출력
SELECT LPAD('ORACLE', 10, '#')
    FROM DUAL;

SELECT ENAME, SAL
    FROM EMP;
    
SELECT ENAME, LPAD(SAL, 6, '*')
    FROM EMP;

--      EMP테이블의 사원을 출력(S****, 이름은 앞 한글자만 출력)
--      WARD는 W*** (RAPD, SUBSTR, LENGTH)
SELECT EMPNO, RPAD(SUBSTR(ENAME, 1, 1), 5, '*') ENAME
    FROM EMP;

--      7499    _****H  80/12/** 를 출력 
--      7521    __***D  81/01/**
SELECT EMPNO, LPAD(LPAD(SUBSTR(ENAME, -1, 1), LENGTH(ENAME), '*'), 10, ' ') ENAME,
    RPAD(SUBSTR(HIREDATE, 1, 6), LENGTH(HIREDATE), '*') HIREDATE
    FROM EMP;
    
--      이름의 세번째 자리가 R인 사원의 모든 필드(LIKE, INSTR, SUBSTR)
SELECT *
    FROM EMP
    WHERE ENAME LIKE '__R%';
    
SELECT *
    FROM EMP
    WHERE INSTR(ENAME, 'R', 3) = 3;

SELECT *
    FROM EMP
    WHERE SUBSTR(ENAME, 3, 1) = 'R';

--  7) TRIM
SELECT TRIM('       ORACLE DB           ') MSG
    FROM DUAL;

SELECT LTRIM('       ORACLE DB           ') MSG
    FROM DUAL;

SELECT RTRIM('       ORACLE DB           ') MSG
    FROM DUAL;
    
--   8) REPLACE
--      모든 A를 XX로 치환
SELECT REPLACE(ENAME, 'A', 'XX')
    FROM EMP;

SELECT REPLACE(HIREDATE, '0', 'XX')
    FROM EMP;    

    
    
--  3. 날짜 관련 함수 및 예약어
--   1) SYSDATE : 지금
SELECT SYSDATE
    FROM DUAL;

ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD DY HH24:MI';
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';
    
SELECT TO_CHAR(SYSDATE, 'YY-MM-DD HH24:MI:SS')
    FROM DUAL;

--      오라클 타입 : 문자, 숫자, 날짜 (숫자, 날짜는 연산 가능)
SELECT SYSDATE-1, SYSDATE, SYSDATE+1
    FROM DUAL;
    
--      EMP 테이블에서 이름, 입사일, 근무한 날짜를 출력
SELECT ENAME, HIREDATE, FLOOR((SYSDATE - HIREDATE)) "WORKINGDAY"
    FROM EMP
    ORDER BY WORKINGDAY DESC;
    
SELECT ENAME, HIREDATE, TRUNC((SYSDATE - HIREDATE)) "WORKINGDAY"
    FROM EMP
    ORDER BY WORKINGDAY DESC;
    
--      이름, 입사일, 근무 주수, 근무 년수
SELECT ENAME, HIREDATE, FLOOR((SYSDATE-HIREDATE) / 7) "WORKINGWEEKS",
    FLOOR((SYSDATE-HIREDATE) / 365) "WORKINGYEARS"
    FROM EMP;

--      이름, 입사일, 근무 월수(MONTHS_BETWEEN() 함수를 이용)
SELECT ENAME, HIREDATE, TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) "WORKINGMONTHS"
    FROM EMP;
    
--      이름, 입사일, 수습종료시점(ADD_MONTHS() 함수를 이용)
--      ADD_MONTHS(특정시점, 몇 개월 후) : 특정시점부터 몇 개월 후의 날짜를 반환
SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 3)
    FROM EMP;
    
--      이름, 입사한 이후 받은 급여 + 상여(급여는 매달 SAL을 받고, 상여는 두번 COMM을 받음)
SELECT ENAME, TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) * SAL +
            TRUNC((SYSDATE - HIREDATE)/365) *2 * NVL(COMM,0) COST
    FROM EMP;
    
--   2) 특정날짜로부터 처음 오는 수요일 NEXT_DAY(특정날짜, '수')
SELECT NEXT_DAY(SYSDATE, '토')
    FROM DUAL;
    
--   3) 특정날짜의 달의 말일 LAST_DAY(특정날짜)
SELECT LAST_DAY(SYSDATE)
    FROM DUAL;

--      EMP 테이블의 이름, 입사일 월급날(IF 월급날 =  말일)
SELECT ENAME, HIREDATE, LAST_DAY(HIREDATE)
    FROM EMP;

--   4) 날짜 반올림 ROUND, 날짜 버림 TRUNC
--      MONTH는 해당월에서 가까운 1일(1~15일기준), 넘어가면 다음달 1일
--      YEAR은 가까운 1월 1일
--      DAY는 가까운 일요일
SELECT ROUND(SYSDATE, 'YEAR')
    FROM DUAL;

SELECT ROUND(SYSDATE, 'MONTH')
    FROM DUAL;
    
SELECT ROUND(SYSDATE, 'DAY')
    FROM DUAL;

SELECT ROUND(SYSDATE)
    FROM DUAL;
    
SELECT TRUNC(SYSDATE, 'YEAR')
    FROM DUAL;

SELECT TRUNC(SYSDATE, 'MONTH')
    FROM DUAL;
    
SELECT TRUNC(SYSDATE, 'DAY')
    FROM DUAL;

SELECT TRUNC(SYSDATE)
    FROM DUAL;
    
--      EMP 테이블에서 이름, 입사일, 입사한 달의 2일 을 출력
SELECT ENAME, HIREDATE, TRUNC(HIREDATE, 'MONTH')+1 "입사한 달의 2일"
    FROM EMP;
    
--      EMP 테이블에서 이름, 입사일, 월급날(5일)
--      15~16일 기준을 4~5일 기준으로 바꿔야 함
SELECT ENAME, HIREDATE, ROUND(HIREDATE+11, 'MONTH')+4 "월급날(5일 기준)"
    FROM EMP;
    
--      EMP 테이블에서 이름, 입사일, 월급날(15일)    
SELECT ENAME, HIREDATE, ROUND(HIREDATE+1, 'MONTH')+14 "월급날(15일 기준)"
    FROM EMP;

--      EMP 테이블에서 이름, 입사일, 월급날(25일)    
SELECT ENAME, HIREDATE, ROUND(HIREDATE-9, 'MONTH')+24 "월급날(25일 기준)"
    FROM EMP; 
    
    
    
--  4. 형변환 함수
--   1) TO_CHAR() = 문자로 형 변환
--      YYYY 년도 4자리 / YY 년도 2자리 / RR 년도 2자리
--      MM 월 / DD 일 / DY 요일
--      HH24 24시간 / HH12 12시간/ AM / PM
SELECT TO_CHAR(SYSDATE, 'YYYY"년"/MM"월"/DD"일"/DY"요일"/HH24:MI:SS')
    FROM DUAL;
    
SELECT ENAME, TO_CHAR(HIREDATE, 'YY/MM/DD DY HH12:MI:SS') TIME
    FROM EMP;
    
--   1-1) TO_CHAR(숫자데이터, '출력형식') = 숫자데이터를 문자로 변환
--      0은 자릿수가 많으면 0으로 채우고, 9는 숫자만큼만 출력하게 함
--      ','는 세자리마다 가능, '.'은 소수점
--      L은 지역통화 단위, $가 앞에 붙을 수 있음
SELECT TO_CHAR(12345678, '999,999,999')
    FROM DUAL;

SELECT TO_CHAR(12345678, '000,000,000')
    FROM DUAL;

SELECT TO_CHAR(1234, 'L9,999')
    FROM DUAL;

SELECT ENAME, SAL, TO_CHAR(SAL, '$99,999')
    FROM EMP;

--   2) TO_DATE(문자, '패턴') = 날짜로 형 변환
SELECT TO_DATE('19810101', 'YYYYMMDD')
    FROM DUAL;

--      81년 5월 1일부터 83년 5월 1일 사이에 입사한 직원의 모든 필드 출력
ALTER SESSION SET NLS_DATE_FORMAT = 'MM/DD/YYYY';

SELECT *
    FROM EMP
    WHERE HIREDATE BETWEEN TO_DATE('810501', 'RRMMDD') AND
        TO_DATE(830501, 'RRMMDD');
    
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';
    
--   3) TO_NUMBER(문자, 패턴)
SELECT TO_NUMBER('3,456.78', '9,999.999')
    FROM DUAL;

SELECT '3456.78'+1
    FROM DUAL;
    
SELECT '3,456.78'+1
    FROM DUAL;    
    
--   4) NVL(NULL일수도 있는 데이터, NULL을 대신 할 값) : 매개변수의 타입은 같아야 함
--      이름, 상사의 사번을 출력 (단, 직속상사가 없을 경우 'CEO'라고 표기)
SELECT ENAME, NVL(TO_CHAR(MGR), 'CEO') 상사의사번
    FROM EMP;
    
--   5) ETC
--   5-1) EXTRACT : 연도나 월만 추출하고자 할 때
SELECT EXTRACT(YEAR FROM SYSDATE)
    FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYY')
    FROM DUAL;

SELECT EXTRACT(MONTH FROM SYSDATE)
    FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'MM')
    FROM DUAL;
    
--      81년도에 입사한 직원 추출
SELECT *
    FROM EMP
    WHERE EXTRACT(YEAR FROM HIREDATE) = 1981;
    
SELECT *
    FROM EMP
    WHERE TO_CHAR(HIREDATE, 'YY') = '81';
 
 SELECT *
    FROM EMP
    WHERE HIREDATE BETWEEN TO_DATE('19810101', 'YYYY-MM-DD')
        AND TO_DATE('1981-12-31', 'YYYY-MM-DD');
        
--   5-2) LEVEL : START WITH 조건, CONNECT BY PRIOR 조건
SELECT LEVEL, LPAD(' ', LEVEL*2)||ENAME
    FROM EMP
    START WITH MGR IS NULL
    CONNECT BY PRIOR EMPNO = MGR;
    
    

-- <총 연습문제>
-- 1. 현재 날짜를 출력하고 TITLE에 “Current Date”로 출력하는 SELECT 문장을 기술하시오.
SELECT SYSDATE "Current Date"
    FROM DUAL;

-- 2. EMP 테이블에서 현재 급여에 15%가 증가된 급여를 계산하여,
-- 사원번호,이름,업무,급여,증가된 급여(New Salary),증가액(Increase)를 출력하는 SELECT 문장
SELECT ENAME, JOB, SAL, (SAL+SAL*0.15) "New Salary", (SAL*0.15) "Increase"
    FROM EMP;

--3. 이름, 입사일, 입사일로부터 6개월 후 돌아오는 월요일 구하여 출력하는 SELECT 문장을 기술하시오.
SELECT ENAME, HIREDATE, NEXT_DAY(ADD_MONTHS(HIREDATE, 6), '월요일') MONTHS
    FROM EMP;

--4. 이름, 입사일, 입사일로부터 현재까지의 개월수, 급여, 입사일부터 현재까지의 받은 급여의 총계를 출력
SELECT ENAME, HIREDATE, TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) "Months",
    SAL, TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) * SAL "Sal Sal"
    FROM EMP;

--5. 모든 사원의 이름과 급여(15자리로 출력 좌측의 빈 곳은 “*”로 대치)를 출력
SELECT ENAME, LPAD(SAL, 15, '*') SAL
    FROM EMP;

--6. 모든 사원의 정보를 이름,업무,입사일,입사한 요일을 출력하는 SELECT 문장을 기술하시오.
SELECT ENAME, JOB, HIREDATE, TO_CHAR(HIREDATE, 'DAY') WORKINGDAY
    FROM EMP;
    
SELECT ENAME, JOB, HIREDATE, TO_CHAR(HIREDATE, 'DY"요일"') WORKINGDAY
    FROM EMP;

--7. 이름의 길이가 6자 이상인 사원의 정보를 이름,이름의 글자수,업무를 출력
SELECT ENAME, LENGTH(ENAME) WORDS, JOB
    FROM EMP
    WHERE LENGTH(ENAME) >= 6;

--8. 모든 사원의 정보를 이름, 업무, 급여, 보너스, 급여+보너스를 출력
SELECT ENAME, JOB, SAL, NVL(COMM, 0) BONUS, SAL+NVL(COMM, 0) SALSAL
    FROM EMP;

-- 9.사원 테이블의 사원명에서 2번째 문자부터 3개의 문자를 추출하시오. 
SELECT SUBSTR(ENAME, 2, 3)
    FROM EMP;

--10. 사원 테이블에서 입사일이 12월인 사원의 사번, 사원명, 입사일을 검색하시오. 
--  시스템에 따라 DATEFORMAT 다를 수 있으므로 아래의 방법도 알아보자
SELECT EMPNO, ENAME, HIREDATE
    FROM EMP
    WHERE TO_CHAR(HIREDATE, 'MM') = '12';

--11. 다음과 같은 결과를 검색할 수 있는 SQL 문장을 작성하시오
--EMPNO		ENAME		급여
--7369		       SMITH		*******800
--7499		       ALLEN		******1600
--7521		       WARD		******1250
--……. 
SELECT EMPNO, ENAME, LPAD(LPAD(SAL, LENGTH(SAL), ' '), 10, '*') SAL
    FROM EMP;

-- 12. 다음과 같은 결과를 검색할 수 있는 SQL 문장을 작성하시오
-- EMPNO	 ENAME 	입사일
-- 7369	  SMITH		1980-12-17
-- ….
SELECT EMPNO, ENAME, TO_CHAR(HIREDATE, 'YYYY-MM-DD') HIREDATE
    FROM EMP;

--13. 사원 테이블에서 부서 번호가 20인 사원의 사번, 이름, 직무, 급여를 출력하시오.
    --(급여는 앞에 $를 삽입하고3자리마다 ,를 출력한다)  
SELECT E.EMPNO, ENAME, JOB, TO_CHAR(SAL, '$9,999') SAL
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND E.DEPTNO = 20;