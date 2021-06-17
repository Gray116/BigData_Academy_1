--★ 그룹함수
--  1. 단일행 함수

SELECT ENAME, ROUND(SAL, -3)
    FROM EMP;

--      그룹함수
--          그룹함수(MIN, MAX, COUNT)는 숫자, 날짜, 문자형 모두 사용가능
SELECT MAX(SAL)
    FROM EMP;
    
SELECT DEPTNO, MAX(SAL)
    FROM EMP
    GROUP BY DEPTNO;
    
--      그룹함수 실습
SELECT ROUND(AVG(SAL), 2)
    FROM EMP;
    
SELECT COUNT(SAL)
    FROM EMP;

SELECT AVG(SAL), SUM(SAL) / COUNT(SAL)
    FROM EMP;

SELECT AVG(COMM) 평균, SUM(COMM) 합계, COUNT(COMM) 갯수,
    SUM(COMM) / COUNT(COMM) 평균2
    FROM EMP;

--      1) EMP 테이블의 행(로우)수
SELECT COUNT(*)
    FROM EMP;
    
--      2) SAL의 평균, 합, 최소값, 최대값, 분산, 표준편차
SELECT ROUND(AVG(SAL), 2), SUM(SAL), MIN(SAL), MAX(SAL), ROUND(VARIANCE(SAL), 2),
    ROUND(STDDEV(SAL)), COUNT(SAL)
    FROM EMP;

SELECT ROUND(SQRT(VARIANCE(SAL)), 2)
    FROM EMP;

--      가장 최근에 입사한 사원의 입사일과 입사한지 가장 오래된 사원의 입사일 출력
SELECT MIN(HIREDATE), MAX(HIREDATE)
    FROM EMP;
--      최근입사 : X,XXX일 근무, 최초입사 : XX,XXX일 근무2
SELECT MAX(HIREDATE)||' 최근입사 : '||TO_CHAR(TRUNC(MIN(SYSDATE - HIREDATE)), '99,999')||'일 근무'
    FROM EMP;
    
SELECT MIN(HIREDATE)||' 최초입사 : '||TO_CHAR(TRUNC(MAX(SYSDATE - HIREDATE)), '99,999')||'일 근무'
    FROM EMP;
    
--      10번 부서 소속의 사원 급여 평균
SELECT ROUND(AVG(SAL))
    FROM EMP
    WHERE DEPTNO = 10;
    
    
    
--  2. GROUP BY 함수
SELECT DEPTNO, MAX(SAL)
    FROM EMP
    GROUP BY DEPTNO;

--      부서번호별 사원수, 최대급여, 최소급여, 평균급여(소수점 두자리)
SELECT DEPTNO, COUNT(*), MAX(SAL), MIN(SAL), ROUND(AVG(SAL), 2)
    FROM EMP
    GROUP BY DEPTNO
    ORDER BY DEPTNO;

--      급여가 5000미만인 사원에 대해서만 부서번호별 사원수, 최대급여, 최소급여, 평균급여 출력
SELECT DEPTNO, COUNT(*), MAX(SAL), MIN(SAL), ROUND(AVG(SAL), 2)
    FROM EMP
    WHERE SAL < 5000
    GROUP BY DEPTNO
    ORDER BY DEPTNO;
    
--      부서명별 사원수, 최대급여, 최소급여, 평균급여
SELECT DNAME, COUNT(*), MAX(SAL), MIN(SAL), ROUND(AVG(SAL),2)
    FROM DEPT D, EMP E
    WHERE D.DEPTNO = E.DEPTNO
    GROUP BY DNAME
    ORDER BY DNAME;


    
--  3. HAVING 절 : 그룹 함수결과에 대한 조건
--      부서번호 별 평균 급여(평균 급여가 2000이상인 부서만 출력)
--          필드의 별칭은 ORDER BY 절에서만 가능, HAVING은 불가
SELECT DEPTNO, ROUND(AVG(SAL), 2)
    FROM EMP
    GROUP BY DEPTNO
    HAVING AVG(SAL) >= 2000
    ORDER BY AVG(SAL) DESC;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    











  
  
  
  
  
  
  
  
   