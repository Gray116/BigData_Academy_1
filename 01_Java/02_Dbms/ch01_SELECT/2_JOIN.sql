-- ① JOIN
--      테이블 2개 이상을 연결하여 조회하는 기능
SELECT *
    FROM EMP
    WHERE ENAME = 'SCOTT';

SELECT *
    FROM DEPT
    WHERE DEPTNO = 20;



--   ★ CROSS JOIN : FROM절에 테이블 2개 이상
--      EMP 테이블의 1행 * DEPT 테이블의 4행
SELECT *
    FROM EMP, DEPT
    WHERE ENAME = 'SCOTT';

SELECT *
    FROM EMP, DEPT;



--   ★ EQUI JOIN
--      공통 필드인 DEPTNO값이 일치되는 조건만 JOIN
SELECT *
    FROM EMP, DEPT
    WHERE (ENAME = 'SCOTT') AND (EMP.DEPTNO = DEPT.DEPTNO);

--      테이블의 별칭이 있으면 그 별칭으로만 테이블을 액세스 할 수 있다
SELECT EMPNO NO, ENAME, E.DEPTNO, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    ORDER BY NO;

--  연습문제
--   1) 급여가 2000 이상인 직원만 이름, 업무, 급여, 부서명, 근무지 출력
SELECT ENAME 이름, JOB 업무, SAL 급여, DNAME 부서명, LOC 근무지
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND SAL >= 2000;

--   2) 근무지가 CHICAGO인 사람의 이름, 업무, 급여를 출력
SELECT ENAME 이름, JOB 업무, SAL 급여, LOC 근무지
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND LOC = 'CHICAGO';
    
--   3) 부서번호가 10이거나 20번인 사원의 이름(ENAME), 업무(JOB), 근무지(LOC)를 급여순으로 출력
SELECT ENAME 이름, JOB 업무, LOC 근무지
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND E.DEPTNO IN(10,20)
    ORDER BY SAL;

--   4) JOB이 SALESMAN이거나 MANAGER인 사원의 이름, 급여, 상여, 연봉, 부서명, 근무지를
--      연봉이 큰 순으로 정렬
SELECT ENAME 이름, SAL 급여, COMM 상여, SAL*12+NVL(COMM,0) 연봉, DNAME 부서명, LOC 근무지
    FROM EMP E, DEPT D
    WHERE (E.DEPTNO = D.DEPTNO) AND E.JOB IN('SALESMAN', 'MANAGER')
    ORDER BY 연봉 DESC;
    
--   5) COMM이 NULL이고 급여가 1200이상인 사원의 이름, 급여, 입사일, 부서번호, 부서명을 출력
--      부서명순, 급여가 큰순으로 정렬
SELECT ENAME 이름, SAL 급여, HIREDATE 입사일, E.DEPTNO 부서번호, DNAME 부서명
    FROM EMP E, DEPT D
    WHERE (E.DEPTNO = D.DEPTNO) AND (COMM IS NULL) AND (SAL>=1200)
    ORDER BY 부서명, 급여 DESC;
    
--   6) 'NEW YORK'에서 근무하는 사원의 이름과 급여를 출력
SELECT ENAME 이름, SAL 급여
    FROM EMP E, DEPT D
    WHERE (E.DEPTNO = D.DEPTNO) AND LOC = 'NEW YORK';

--   7) 'ACCOUNTING' 부서 소속의 사원이름과 입사일을 출력
SELECT ENAME 이름, HIREDATE 입사일
    FROM EMP E, DEPT D
    WHERE (E.DEPTNO = D.DEPTNO) AND DNAME = 'ACCOUNTING';

--   8) 직급이 MANAGER인 사원의 이름, 부서명 출력
SELECT ENAME 이름, DNAME 부서명
    FROM EMP E, DEPT D
    WHERE (E.DEPTNO = D.DEPTNO) AND JOB = 'MANAGER';

--   9) COMM이 NULL이 아닌 사원의 이름, 급여, 부서번호, 근무지 출력
SELECT ENAME 이름, SAL 급여, E.DEPTNO 부서번호, LOC 근무지
    FROM EMP E, DEPT D
    WHERE (E.DEPTNO = D.DEPTNO) AND (COMM IS NOT NULL);
 
 
 
 --  ★ NON-EQUI JOIN   
SELECT *
    FROM EMP
    WHERE ENAME = 'SCOTT';

SELECT *
    FROM SALGRADE;

--      CROSS JOIN 발생, EMP의 1행 X SALGRADE 5행    
SELECT *
    FROM EMP, SALGRADE
    WHERE ENAME = 'SCOTT';
    
SELECT * 
    FROM EMP, SALGRADE
    WHERE (ENAME = 'SCOTT') AND (SAL BETWEEN LOSAL AND HISAL);
    
--  1) 모든 사원의 사번, 이름, 업무, 상사사번, 급여, 급여등급(ex. 1등급, 2등급)
SELECT EMPNO 사번, ENAME 이름, JOB 업무, MGR 상사사번, SAL 급여, GRADE||'등급' 급여등급
    FROM EMP, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL;

--  2) COMM이 NULL이 아닌 사원의 이름, 급여, 급여등급, 부서번호, 부서이름, 근무지 출력
SELECT ENAME 이름, SAL 급여, GRADE 급여등급, E.DEPTNO 부서번호, DNAME 부서이름, D.LOC 근무지
    FROM EMP E, DEPT D, SALGRADE
    WHERE (E.DEPTNO = D.DEPTNO) 
                AND (SAL BETWEEN LOSAL AND HISAL)
                AND (COMM IS NOT NULL);

--  3) 이름, 급여, 입사일, 급여등급을 출력
SELECT ENAME 이름, SAL 급여, HIREDATE 입사일, GRADE 급여등급
    FROM EMP, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL;

--  4) 이름, 급여, 입사일, 급여등급, 부서명, 근무지 출력
SELECT ENAME 이름, SAL 급여, HIREDATE 입사일, GRADE 급여등급, DNAME 부서명, LOC 근무지
    FROM EMP E, DEPT D, SALGRADE
    WHERE (E.DEPTNO = D.DEPTNO) AND (SAL BETWEEN LOSAL AND HISAL);

--  5) 이름, 급여, 급여등급, 연봉 출력 (단, 부서별 정렬, 같으면 연봉순)
SELECT ENAME 이름, SAL 급여, GRADE 급여등급, SAL*12+NVL(COMM, 0) 연봉
    FROM EMP, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL
    ORDER BY DEPTNO, 연봉;
    
SELECT ENAME 이름, SAL 급여, GRADE 급여등급, SAL*12+NVL(COMM, 0) 연봉
    FROM EMP E, SALGRADE, DEPT D
    WHERE (SAL BETWEEN LOSAL AND HISAL) AND (E.DEPTNO = D.DEPTNO)
    ORDER BY DNAME, 연봉;
    
--  6) 이름, 업무, 급여, 급여등급, 부서번호, 부서명을 출력 (단, 급여가 1000과 3000사이,
--      부서별, 업무별, 급여가 큰 순 정렬)
SELECT ENAME 이름, JOB 업무, SAL 급여, GRADE 급여등급, E.DEPTNO 부서번호, DNAME 부서명
    FROM EMP E, DEPT D, SALGRADE
    WHERE (E.DEPTNO = D.DEPTNO) AND (SAL BETWEEN LOSAL AND HISAL)
                AND (SAL BETWEEN 1000 AND 3000)
    ORDER BY 부서명, 업무, 급여 DESC;

--  7) 이름, 급여, 등급, 입사일, 근무지를 출력 (단, 81년에 입사한 사람만 출력, 등급이 큰 순
--      으로 정렬)
SELECT ENAME 이름, SAL 급여, GRADE 등급, HIREDATE 입사일, LOC 근무지
    FROM EMP E, DEPT D, SALGRADE
    WHERE (E.DEPTNO = D.DEPTNO) AND TO_CHAR(HIREDATE, 'RR') = 81
                AND(SAL BETWEEN LOSAL AND HISAL)
    ORDER BY 등급 DESC;
    
    
    
--  ★ SELF JOIN
SELECT EMPNO, ENAME, MGR
    FROM EMP
    WHERE ENAME = 'SCOTT';
    
SELECT EMPNO, ENAME
    FROM EMP
    WHERE EMPNO = 7566;
    
SELECT WORKER.EMPNO, WORKER.ENAME "EMPLOYEE", WORKER.MGR "MGRNO", MANAGER.ENAME "MANAGER"
    FROM EMP WORKER, EMP MANAGER
    WHERE WORKER.MGR = MANAGER.EMPNO AND WORKER.ENAME = 'SMITH';
    
--  1) 모든 사원의 사번, 이름, 상사의 사번, 상사의 이름을 출력
SELECT WORKER.EMPNO 사번, WORKER.ENAME 사원, MANAGER.EMPNO 상사번호, MANAGER.ENAME 상사명
    FROM EMP WORKER, EMP MANAGER
    WHERE WORKER.MGR = MANAGER.EMPNO;

--  2) 'SMITH의 상사는 FORD'다 와 같이 출력
SELECT W.ENAME||'의 상사는 ' || M.ENAME||'이다.' A
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO;

--  3) 상사의 이름이 'KING'인 사원들의 이름과 JOB을 출력
SELECT W.ENAME 사원이름, W.JOB 직업
    FROM EMP W, EMP M
    WHERE (W.MGR = M.EMPNO) AND M.ENAME = 'KING';

--  4) 'SCOTT'과 동일한 부서번호에서 근무하는 사람의 이름을 출력
SELECT ENAME, DEPTNO
    FROM EMP
    WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT');
    
SELECT E2.ENAME, E2.DEPTNO
    FROM EMP E1, EMP E2
    WHERE E1.ENAME = 'SCOTT'
        AND E2.ENAME != 'SCOTT'
        AND E1.DEPTNO = E2.DEPTNO;

--  5) 'SCOTT'과 동일한 근무지에서 근무하는 사람의 이름을 출력
INSERT INTO DEPT VALUES (50, 'IT', 'DALLAS');

SELECT * FROM EMP;
INSERT INTO EMP VALUES(9999, 'HONG', NULL, NULL, NULL, 9000, NULL, 50);

SELECT E2.ENAME
    FROM EMP E1, EMP E2, DEPT D1, DEPT D2
    WHERE E1.ENAME = 'SCOTT'
        AND E2.ENAME != 'SCOTT'
        AND E1.DEPTNO = D1.DEPTNO
        AND E2.DEPTNO = D2.DEPTNO
        AND D1.LOC = D2.LOC;

ROLLBACK; -- DML 취소



--   ★ OUTER JOIN
SELECT W.ENAME, W.MGR, M.EMPNO, M.ENAME
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO(+);
    
--  1) 'SMITH의 매니저는 FORD입니다' 포맷으로 출력
SELECT W.ENAME||'의 매니저는 '||M.ENAME||'입니다.' 메세지
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO(+);
    
--  2) 'KING의 매니저는 없습니다.' 포맷으로 출력
SELECT W.ENAME||'의 매니저는 '||NVL(M.ENAME, '없습니다') 메세지
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO(+);

--  3) 말단 사원 출력
SELECT W.ENAME, W.MGR, M.EMPNO, M.ENAME
    FROM EMP W, EMP M
    WHERE W.MGR(+) = M.EMPNO AND W.ENAME IS NULL;
    
SELECT M.EMPNO, M.ENAME
    FROM EMP W, EMP M
    WHERE W.MGR(+) = M.EMPNO AND W.ENAME IS NULL;
    
    
    
--  총 연습문제 (시험 연습 문제)
--   1) 이름, 직속상사
SELECT W.ENAME 이름, M.MGR 직속상사, M.ENAME 상사명
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO;

--   2) 이름, 급여, 업무, 직속상사
SELECT W.ENAME 이름, W.SAL 급여, W.JOB 업무, M.ENAME 직속상사
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO;

--   3) 이름, 급여, 업무, 직속상사. (상사가 없는 직원까지 전체 직원 다 출력.
--      상사가 없을 시 '없음'으로 출력)
SELECT W.ENAME 이름, W.SAL 급여, W.JOB 업무, NVL(M.ENAME, '없음') 직속상사
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO(+);

--   4) 이름, 급여, 부서명, 직속상사명
SELECT W.ENAME 이름, W.SAL 급여, DNAME 부서명, M.ENAME 직속상사
    FROM EMP W, EMP M, DEPT D
    WHERE (W.MGR = M.EMPNO) AND (W.DEPTNO = D.DEPTNO);

--   5) 이름, 급여, 부서코드, 부서명, 근무지, 직속상사명, (상사가 없는 직원까지 전체 직원 다 출력)
SELECT W.ENAME 이름, W.SAL 급여, W.DEPTNO 부서코드, DNAME 부서명, LOC 근무지, M.ENAME 직속상사
    FROM EMP W, EMP M, DEPT D
    WHERE (W.MGR = M.EMPNO(+)) AND (W.DEPTNO = D.DEPTNO);

--   6) 이름, 급여, 등급, 부서명, 직속상사명. 급여가 2000이상인 사람
SELECT W.ENAME 이름, W.SAL 급여, GRADE 등급, D.DNAME 부서명, M.ENAME 직속상사
    FROM EMP W, EMP M, DEPT D, SALGRADE
    WHERE (W.MGR = M.EMPNO) AND (W.DEPTNO = D.DEPTNO)
        AND (W.SAL BETWEEN LOSAL AND HISAL) AND (W.SAL >= 2000);

--   7) 이름, 급여, 등급, 부서명, 직속상사명, (직속상사가 없는 직원까지 전체직원 부서명 순 정렬)
SELECT W.ENAME 이름, W.SAL 급여, GRADE 등급, DNAME 부서명, M.ENAME 직속상사
    FROM EMP W, EMP M, DEPT D, SALGRADE
    WHERE (W.MGR = M.EMPNO(+)) AND (W.DEPTNO = D.DEPTNO)
        AND (W.SAL BETWEEN LOSAL AND HISAL)
    ORDER BY 부서명;

--   8) 이름, 급여, 등급, 부서명, 연봉, 직속상사명. 연봉=(급여+comm)*12 단 comm이 null이면 0
SELECT W.ENAME 이름, W.SAL 급여, GRADE 등급, DNAME 부서명, (W.SAL*12+NVL(W.COMM,0)) 연봉,  M.ENAME 직속상사
    FROM EMP W, EMP M, DEPT D, SALGRADE
    WHERE (W.MGR = M.EMPNO) AND (W.DEPTNO = D.DEPTNO)
        AND (W.SAL BETWEEN LOSAL AND HISAL);

--   9) 8번을 부서명 순 부서가 같으면 급여가 큰 순 정렬
SELECT W.ENAME 이름, W.SAL 급여, GRADE 등급, DNAME 부서명, (W.SAL*12+NVL(W.COMM,0)) 연봉, M.ENAME 직속상사
    FROM EMP W, EMP M, DEPT D, SALGRADE
    WHERE (W.MGR = M.EMPNO) AND (W.DEPTNO = D.DEPTNO)
        AND (W.SAL BETWEEN LOSAL AND HISAL)
    ORDER BY 부서명, 급여 DESC;
    
    
--  연습문제 PART2
--   1)EMP 테이블에서 모든 사원에 대한 이름,부서번호,부서명을 출력하는 SELECT 문장을 작성하여라.
SELECT E.ENAME, E.DEPTNO, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO;

--   2) EMP 테이블에서 NEW YORK에서 근무하고 있는 사원에 대하여 이름,업무,급여,부서명을 출력
SELECT E.ENAME, JOB, E.SAL, E.DEPTNO
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND LOC = 'NEW YORK';

--   3) EMP 테이블에서 보너스를 받는 사원에 대하여 이름,부서명,위치를 출력
SELECT ENAME, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND COMM IS NOT NULL
        AND COMM != 0;

--   4) EMP 테이블에서 이름 중 L자가 있는 사원에 대하여 이름,업무,부서명,위치를 출력
SELECT ENAME, JOB, DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND ENAME LIKE '%L%';

--   5) 사번, 사원명, 부서코드, 부서명을 검색하라. 사원명기준으로 오름차순정열
SELECT EMPNO, ENAME, E.DEPTNO, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    ORDER BY ENAME;

--   6) 사번, 사원명, 급여, 부서명을 검색하라. 
--      단 급여가 2000이상인 사원에 대하여 급여를 기준으로 내림차순으로 정열하시오
SELECT EMPNO, ENAME, SAL, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND SAL>=2000
    ORDER BY SAL DESC;

--   7) 사번, 사원명, 업무, 급여, 부서명을 검색하시오. 단 업무가 MANAGER이며 급여가 2500이상인
--      사원에 대하여 사번을 기준으로 오름차순으로 정열하시오.
SELECT EMPNO, ENAME, JOB, SAL, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND JOB = 'MANAGER' AND SAL >=2500
    ORDER BY EMPNO;

--   8) 사번, 사원명, 업무, 급여, 등급을 검색하시오. 단, 급여기준 내림차순으로 정렬하시오
SELECT EMPNO, ENAME, JOB, SAL, GRADE
    FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO = D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL
    ORDER BY SAL DESC;

--   9) 사원테이블에서 사원명, 사원의 상사를 검색하시오(상사가 없는 직원까지 전체)
SELECT W.ENAME, M.ENAME
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO(+);

--   10) 사원명, 상사명, 상사의 상사명을 검색하시오
SELECT W.ENAME, M.ENAME 상사, MM.ENAME "상사의 상사"
    FROM EMP W, EMP M, EMP MM
    WHERE W.MGR = M.EMPNO AND M.MGR = MM.EMPNO;

--   11) 위의 결과에서 상위 상사가 없는 모든 직원의 이름도 출력되도록 수정하시오
SELECT W.ENAME, M.ENAME 상사, MM.ENAME "상사의 상사"
    FROM EMP W, EMP M, EMP MM
    WHERE W.MGR = M.EMPNO(+) AND M.MGR = MM.EMPNO(+);