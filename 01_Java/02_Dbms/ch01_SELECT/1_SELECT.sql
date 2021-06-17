-- [ⅰⅰ] SELECT(조회) 문 -
-- ① SQL문장 작성법

select * from tab; -- 현 계정(scott)이 가지고 있는 테이블을 조회, 대문자로 입력하는 습관 필요.

SELECT * from DEPT; -- DEPT 테이블에 있는 모든 행,열을 출력

SELECT * from EMP; -- EMP 테이블에 있는 모든 행,열을 출력

-- 1). DEPT 테이블의 구조 확인
DESC EMP;

-- ② SQL문 실행 (특정 열만 출력)
SELECT EMPNO, ENAME, SAL, JOB from EMP; 
SELECT EMPNO AS 사번, ENAME 이름, SAL AS "급여", JOB AS "직책"  -- 별칭은 AS, "" 생략 가능
FROM EMP;

SELECT EMPNO "사 번", ENAME AS "이 름", SAL "급 여", JOB AS "직 책" -- 띄어쓰기가 생길 경우에는 꼭 ""안에 입력
FROM EMP;

SELECT EMPNO NO, ENAME NAME, SAL SALARY FROM EMP;

-- ③ 특정 행 출력하는 WHERE절
--  1) 비교연산자
SELECT EMPNO 사번, ENAME 이름, SAL 급여 FROM EMP
WHERE SAL = 3000;

SELECT EMPNO 사번, ENAME 이름, SAL 급여 FROM EMP
WHERE SAL != 3000;

SELECT EMPNO 사번, ENAME 이름, SAL 급여 FROM EMP
WHERE SAL <> 3000;

SELECT EMPNO 사번, ENAME 이름, SAL 급여 FROM EMP
WHERE SAL ^= 3000;

---- 10번 부서인 사원의 모든 필드를 출력

SELECT * FROM EMP
WHERE DEPTNO = 10;

---- 이름이(ENAME)이 FORD인 직원의 EMPNO, ENAME, MGR을 출력

SELECT EMPNO 사번, ENAME 이름, MGR 상사 FROM EMP
WHERE ENAME = 'FORD'; -- 문자 입력시 ''로 감싸기

-- ④ 논리연산자
--  1) 급여(SAL)이 2000이상 3000미만인 직원의 모든 필드 출력
SELECT * FROM EMP
WHERE SAL>=2000 AND SAL<3000;

---- 비교연산은 숫자, 문자, DATE형 필드 모두 가능

-- 2) 사원의 이름(ENAME)이 'A', 'B', 'C'로 시작하는 사원의 모든 필드 출력
SELECT * FROM EMP
WHERE ENAME < 'D'; -- D보다 작은 문자로 시작하는 사원만 출력됨

-- 3) 81년 이전에 입사한 사원의 모든 필드
SELECT * FROM EMP
WHERE HIREDATE < '81/01/01';

-- 4) 82년도에 입사한 사원의 모든 필드
SELECT * FROM EMP
WHERE HIREDATE > '81/12/31' AND HIREDATE < '83/01/01';

-- 5) 날짜 표기법 설정 (현재 : RR/MM/DD)
ALTER SESSION SET NLS_DATE_FORMAT = 'MM-DD-RR';
ALTER SESSION SET NLS_DATE_FORMAT = 'RR-MM-DD';
SELECT HIREDATE FROM EMP;

-- 6) 연봉이 2400 이상인 직원의 ENAME, SAL, 연봉 출력 (연봉 = SAL*12)
SELECT ENAME 이름, SAL 급여, (SAL*12) 연봉 FROM EMP
    WHERE (SAL*12) > 24000;

SELECT ENAME 이름, SAL 급여, (SAL*12) 연봉 FROM EMP
    WHERE (SAL*12) > 24000;

-- ※ 실행순서 - FROM, WHERE, SELECT, ORDER BY
SELECT ENAME 이름, SAL 급여, (SAL*12) 연봉
    FROM EMP
    WHERE (SAL*12) >= 24000
    ORDER BY 연봉;

-- 7) 10번 부서에서 직책(JOB)이 MANAGER인 사람의 모든 필드
SELECT * FROM EMP
    WHERE DEPTNO =10 AND JOB = 'MANAGER';
    
-- 8) 10번 부서이거나 직책이 MANAGER인 사람의 모든 필드
SELECT * FROM EMP
    WHERE DEPTNO = 10 OR JOB = 'MANAGER';

-- 9) 부서번호가 10번이 아닌 사람의 모든 필드
SELECT * FROM EMP
    WHERE NOT DEPTNO = 10
    ORDER BY DEPTNO;
    
-- ⑤ 산술 표현식
SELECT ENAME, SAL, SAL+100 UPGRADE_SAL FROM EMP
    WHERE DEPTNO = 10;
    
--  1) 모든 사원의 이름, 월급(SAL), 상여(COMM), 연봉(SAL*12+COMM)을 출력
--      산술연산의 결과는 null을 포함하면 결과는 null
--      NVL(NULL일수도 있는 필드명, 대치값), 반드시 둘은 타입이 같아야 함
SELECT ENAME 이름, SAL 월급, COMM 상여, SAL*12+COMM 연봉 FROM EMP;
SELECT ENAME, SAL, COMM, SAL*12+NVL(COMM, 0) FROM EMP;

-- 2) 모든 사원의 사원명, 상사사번(MGR)을 출력 (단, 상사가 없으면 0)
SELECT ENAME 이름, NVL(MGR, 0) 상사사번 FROM EMP
ORDER BY 상사사번;

-- ⑥ 연결연산자(||) : 열이나 문자를 연결
SELECT ENAME || '은(는) ' || JOB AS EMPLOYEES FROM EMP;

-- 1) "SMITH : 1 YEAR SALARY = XXXX"와 같이 모든 행이 출력(단, 연봉은 SAL*12+COMM)
SELECT ENAME || '의 1년 연봉 = ' || (SAL*12+NVL(COMM, 0)) MESSAGE FROM EMP;

-- ⑦ 중복 제거 (DISTINCT)
SELECT DISTINCT JOB FROM EMP;
SELECT DISTINCT DEPTNO FROM EMP;
SELECT * FROM DEPT;

-- ⑧ 연습문제 꼭 풀기
--  1. emp 테이블의 구조 출력 (ORACLE 명령)
DESC EMP;

--  2. emp 테이블의 모든 내용을 출력 
SELECT * FROM EMP;

--  3. 현 scott 계정에서 사용가능한 테이블 출력
SELECT * FROM TAB;
SHOW USER;

--  4. emp 테이블에서 사번, 이름, 급여, 업무, 입사일 출력
SELECT EMPNO 사번, ENAME 이름, SAL 급여, JOB 업무, HIREDATE 입사일 FROM EMP;

--  5. emp 테이블에서 급여가 2000미만인 사람의 사번, 이름, 급여 출력
SELECT EMPNO 사번, ENAME 이름, SAL 급여 FROM EMP
    WHERE SAL < 2000;

--  6. 입사일이 81/02이후에 입사한 사람의 사번, 이름, 업무, 입사일 출력
SELECT EMPNO 사번, ENAME 이름, JOB 업무, HIREDATE 입사일 FROM EMP
    WHERE HIREDATE > '81/02/01';

--  7. 업무가 SALESMAN인 사람들 모든 자료 출력
SELECT * FROM EMP
    WHERE JOB = 'SALESMAN';

--  8. 업무가 CLERK이 아닌 사람들 모든 자료 출력
SELECT * FROM EMP
    WHERE JOB != 'CLERK';
    
SELECT * FROM EMP
    WHERE JOB <> 'CLERK';
    
SELECT * FROM EMP
    WHERE NOT JOB = 'CLERK';

SELECT * FROM EMP
    WHERE JOB ^= 'CLERK';

--  9. 급여가 1500이상이고 3000이하인 사람의 사번, 이름, 급여 출력
SELECT EMPNO 사번, ENAME 이름, SAL 급여 FROM EMP
    WHERE SAL >= 1500 AND SAL<= 3000;

--  10. 부서코드가 10번이거나 30인 사람의 사번, 이름, 업무, 부서코드 출력
SELECT EMPNO 사번, ENAME 이름, JOB 업무, DEPTNO 부서코드 FROM EMP
    WHERE DEPTNO = 10 OR DEPTNO = 30;

--  11. 업무가 SALESMAN이거나 급여가 3000이상인 사람의 사번, 이름, 업무, 부서코드 출력
SELECT EMPNO 사번, ENAME 이름, JOB 업무, DEPTNO 부서코드, SAL 급여 FROM EMP
    WHERE JOB = 'SALESMAN' OR SAL>=3000;

--  12. 급여가 2500이상이고 업무가 MANAGER인 사람의 사번, 이름, 업무, 급여 출력
SELECT EMPNO 사번, ENAME 이름, JOB 업무, SAL 급여 FROM EMP
    WHERE SAL>=2500 AND JOB = 'MANAGER';

--  13.“ename은 XXX 업무이고 연봉은 XX다” 스타일로 모두 출력(연봉은 SAL*12+COMM)
SELECT ENAME || '은(는) ' || JOB || '이고 연봉은 ' || (SAL*12+NVL(COMM, 0)) || '이다.' AS MGR FROM EMP;

-- ⑧ SQL 연산자 (BETWEEN , IN, LIKE, IS NULL)
-- 8-1 BETWEEN
--  1) SAL이 1500이상 3000이하인 사번, 이름, 급여
SELECT EMPNO, ENAME, SAL FROM EMP
    WHERE SAL>=1500 AND SAL<=3000;

-- 필드명 BETWEEN A AND B, A부터 B까지(A, B포함)
SELECT EMPNO, ENAME, SAL FROM EMP
    WHERE SAL BETWEEN 1500 AND 3000;
    
SELECT EMPNO, ENAME, SAL FROM EMP
    WHERE SAL NOT BETWEEN 1500 AND 3000;

-- 2) 82년도에 입사한 직원의 모든 필드 출력
SELECT * FROM EMP
    WHERE HIREDATE BETWEEN '82/01/01' AND '82/12/31';
    
SELECT * FROM EMP
    WHERE HIREDATE NOT BETWEEN '82/01/01' AND '82/12/31';

-- 3) 사원 이름이 'B', 'C'로 시작하는 사원의 모든 필드 출력
SELECT * FROM EMP 
    WHERE ENAME BETWEEN 'B' AND 'D' AND ENAME != 'D';



-- 8-2 IN
--  1) 부서 번호가 10번 20번, 40번 부서의 사원의 모든 필드 출력
SELECT * FROM EMP
    WHERE DEPTNO = 10 OR DEPTNO = 20 OR DEPTNO = 40;

SELECT * FROM EMP
    WHERE DEPTNO IN(10, 20, 40);

-- 2) 부서 번호가 10번, 20번, 40번이 아닌 사원의 모든 필드 출력

SELECT * FROM EMP
    WHERE DEPTNO NOT IN(10, 20, 40);
    
SELECT * FROM EMP
    WHERE DEPTNO != 10 AND DEPTNO != 20 AND DEPTNO != 30;

-- 3) 사번이 7902, 7788, 7566인 사원의 모든 필드

SELECT * FROM EMP
    WHERE EMPNO IN(7902, 7788, 7566);



-- 8-3 LIKE
--  1) 이름이 M으로 시작하는 사원의 모든 필드 출력
--      %는 0글자 이상을 나타냄
SELECT * FROM EMP
    WHERE ENAME LIKE 'M%';

--  2) 이름에 N이 들어가는 사원의 모든 필드 출력
SELECT * FROM EMP
    WHERE ENAME LIKE '%N%';

--  3) S로 끝나는 사원의 모든 필드 출력
SELECT * FROM EMP
    WHERE ENAME LIKE '%S';

-- 4) SAL이 5로 끝나는 사원의 모든 필드 출력
SELECT * FROM EMP
    WHERE SAL LIKE '%5';

-- 5) 82년도에 입사한 사원의 모든 필드 출력
--      NOT LIKE를 하게 되면 그 조건만 제외
SELECT * FROM EMP
    WHERE HIREDATE LIKE '82/%';

SELECT * FROM EMP
    WHERE HIREDATE NOT LIKE '82/%';
    
-- 6) 1월에 입사한 사원의 모든 필드 출력
SELECT * FROM EMP
    WHERE HIREDATE LIKE '__/01/__';



-- 8-4 IS NULL
--  1) 상여금이 없는 사원의 모든 필드를 출력
SELECT * FROM EMP
    WHERE COMM IS NULL OR COMM = 0;

--  2) 상여금이 있는 사원의 모든 필드를 출력
SELECT * FROM EMP
    WHERE COMM IS NOT NULL AND COMM != 0;



-- ⑨ 정렬
--  1) 오름차순 정렬
SELECT ENAME, SAL FROM EMP
    ORDER BY SAL;
    
SELECT ENAME, SAL FROM EMP
    ORDER BY SAL ASC;
    
--  2) 내림차순 정렬
SELECT ENAME, SAL FROM EMP
    ORDER BY SAL DESC;
    
--  3) 문자(시간, 날짜, 이름)로 정렬
SELECT ENAME, SAL FROM EMP
    ORDER BY ENAME;
    
SELECT ENAME, SAL, HIREDATE FROM EMP
    ORDER BY HIREDATE DESC;

--  4) 이름, 연봉(SAL*12+COMM)을 출력(연봉이 높은순, 연봉이 같은 경우 이름순)
SELECT ENAME 이름, SAL*12+NVL(COMM, 0) 연봉 FROM EMP
    ORDER BY 연봉 DESC, 이름;
    
-- 5) 사번, 이름, 급여, 부서번호 출력(부서순, 부서가 같으면 입사일 순으로 출력)
SELECT EMPNO 사번, ENAME 이름, SAL 급여, DEPTNO 부서번호 FROM EMP
    ORDER BY DEPTNO, HIREDATE;



--  연습문제
--1.	EMP 테이블에서 sal이 3000이상인 사원의 empno, ename, job, sal을 출력
SELECT EMPNO 사번, ENAME 이름, JOB 직급, SAL 급여
    FROM EMP
    WHERE SAL >= 3000;

--2.	EMP 테이블에서 empno가 7788인 사원의 ename과 deptno를 출력
SELECT ENAME 이름, DEPTNO 부서번호 
    FROM EMP
    WHERE EMPNO = 7788;

--3.	연봉이 24000이상인 사번, 이름, 급여 출력 (급여순정렬)
SELECT EMPNO 사번, ENAME 이름, SAL*12+NVL(COMM, 0) 급여 
    FROM EMP
    WHERE SAL*12+NVL(COMM, 0) >= 24000
    ORDER BY 급여;

--4.	EMP 테이블에서 hiredate가 1981년 2월 20과 1981년 5월 1일 사이에 입사한 사원의 
--ename,job,hiredate을 출력하는 SELECT 문장을 작성 (단 hiredate 순으로 출력)
SELECT ENAME 이름, JOB 직무, HIREDATE 입사일
    FROM EMP
    WHERE HIREDATE BETWEEN '81/02/20' AND '81/05/01'
    ORDER BY HIREDATE;

--TO_DATE(문자EX)81/02/20, 패턴EX)'RR/MM/DD')는 문자를 날짜형으로 변환
--TO_CHAR(날짜형, 패턴)
SELECT ENAME 이름, JOB 직무, HIREDATE 입사일
    FROM EMP
    WHERE HIREDATE BETWEEN TO_DATE('81/02/20', 'RR/MM/DD')
                                                    AND TO_DATE('1981/05/01', 'YYYY/MM/DD')
    ORDER BY HIREDATE;

--5.	EMP 테이블에서 deptno가 10,20인 사원의 모든 정보를 출력 (단 ename순으로 정렬)
SELECT * 
    FROM EMP
    WHERE DEPTNO = 10 OR DEPTNO = 20
    ORDER BY ENAME;

--6.	EMP 테이블에서 sal이 1500이상이고 deptno가 10,30인 사원의 ename과 sal를 출력
-- (단 HEADING을 employee과 Monthly Salary로 출력)
SELECT ENAME "EMPLOYEE", SAL "MONTHLY SALARY"
    FROM EMP
    WHERE SAL>=1500 AND DEPTNO IN(10, 30);

--7.	EMP 테이블에서 hiredate가 1982년인 사원의 모든 정보를 출력
SELECT *
    FROM EMP
    WHERE HIREDATE LIKE '82%';
    
SELECT *
    FROM EMP
    WHERE TO_CHAR (HIREDATE, 'YYYY') = 1982;

--8.	이름의 첫자가 C부터  P로 시작하는 사람의 이름, 급여 이름순 정렬
SELECT ENAME 이름, SAL 급여
    FROM EMP 
    WHERE (ENAME BETWEEN 'C' AND 'Q') AND ENAME != 'Q'
    ORDER BY 이름;

--9.	EMP 테이블에서 comm이 sal보다 10%가 많은 모든 사원에 대하여 이름, 급여, 상여금을 
--출력하는 SELECT 문을 작성
SELECT ENAME 이름, SAL 급여, COMM 상여금
    FROM EMP
    WHERE COMM > SAL+SAL*0.1;

--10.	EMP 테이블에서 job이 CLERK이거나 ANALYST이고 sal이 1000,3000,5000이 아닌 모든 사원의 정보를 출력
SELECT * 
    FROM EMP
    WHERE JOB IN('CLERK', 'ANALYST') AND SAL NOT IN(1000, 3000, 5000);

--11.	EMP 테이블에서 ename에 L이 두 자가 있고 deptno가 30이거나 또는 mgr이 7782인 사원의 
--모든 정보를 출력하는 SELECT 문을 작성하여라.
SELECT * 
    FROM EMP
     WHERE ENAME LIKE '%L%L%' AND (DEPTNO = 30 OR MGR = 7782);

--12.	사원 테이블에서 입사일이 81년도인 직원의 사번,사원명, 입사일, 업무, 급여를 출력
SELECT EMPNO 사번, ENAME 이름, HIREDATE 입사일, JOB 업무, SAL 급여
    FROM EMP
    WHERE HIREDATE BETWEEN '80/12/31' AND '82/01/01';

SELECT EMPNO 사번, ENAME 이름, HIREDATE 입사일, JOB 업무, SAL 급여
    FROM EMP
    WHERE HIREDATE LIKE '81%';

SELECT EMPNO 사번, ENAME 이름, HIREDATE 입사일, JOB 업무, SAL 급여
    FROM EMP
    WHERE TO_CHAR(HIREDATE, 'RR') = '81';
    
SELECT EMPNO 사번, ENAME 이름, HIREDATE 입사일, JOB 업무, SAL 급여
    FROM EMP
    WHERE HIREDATE BETWEEN TO_DATE('81/01/01', 'RR/MM/DD') AND TO_DATE('81/12/31', 'RR/MM/DD');

--13.	사원 테이블에서 입사일이81년이고 업무가 'SALESMAN'이 아닌 직원의 사번, 사원명, 입사일, 
-- 업무, 급여를 검색하시오.
SELECT EMPNO 사번, ENAME 이름, HIREDATE 입사일, JOB 업무, SAL 급여
    FROM EMP
    WHERE HIREDATE LIKE '81/%' AND NOT JOB = 'SALESMAN';
    
SELECT EMPNO 사번, ENAME 이름, HIREDATE 입사일, JOB 업무, SAL 급여
    FROM EMP
    WHERE TO_CHAR(HIREDATE, 'RR') = '81' AND NOT JOB = 'SALESMAN';

--14.	사원 테이블의 사번, 사원명, 입사일, 업무, 급여를 급여가 높은 순으로 정렬하고, 
-- 급여가 같으면 입사일이 빠른 사원으로 정렬하시오.
SELECT EMPNO 사번, ENAME 사원명, HIREDATE 입사일, JOB 업무, SAL 급여
    FROM EMP
    ORDER BY SAL DESC, HIREDATE;

--15.	사원 테이블에서 사원명의 세 번째 알파벳이 'N'인 사원의 사번, 사원명을 검색하시오
SELECT EMPNO 사번, ENAME 사원
    FROM EMP
    WHERE ENAME LIKE '__N%';

--16.	사원 테이블에서연봉(SAL*12)이 35000 이상인 사번, 사원명, 연봉을 검색 하시오.
SELECT EMPNO 사번, ENAME 사원명, SAL*12+NVL(COMM, 0) 연봉
    FROM EMP
    WHERE SAL*12+NVL(COMM, 0) >= 35000;
    
--17 이름에 A가 들어간 사원의 모든 필드를 출력
SELECT* 
    FROM EMP
    WHERE ENAME LIKE '%A%';

--18 이름에 %가 들어간 사원의 모든 필드를 출력
SELECT  *
    FROM EMP
    WHERE ENAME LIKE '%\%%' ESCAPE '\';
    
INSERT INTO EMP VALUES (9999, 'LISA%', NULL, NULL, NULL, 9000, 9900, 40);

SELECT *
    FROM EMP
    WHERE EMPNO = 9999;

ROLLBACK;