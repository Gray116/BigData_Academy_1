show databases; -- 데이터베이스들의 리스트 확인

use sakila;
show tables;

use world;
show tables;

--	★ DCL (계정생성 및 삭제, 권한부여 및 박탈)
--	 1. 계정 생성
create user user01
	identified by 'password';

--	 2. 권한 부여
grant all on *.*
	to user01;
grant all privileges on *.*
	to user01;

flush privileges;

--	 3. 권한 박탈
revoke all privileges on *.*
	from user01;

--	 4. 계정 삭제    
drop user user01;



--	★ DDL (제약조건, 시퀀스 없음)
--	★ DML (OUTER JOIN, AND대신 &&, OR대신 ||, 일부 단일행 함수 차이)
--	 ※ sql 실행 전, 데이터베이스로 들어가야 함
show databases;

create database GrayDB;

use GrayDB; -- GrayDB로 들어감
select database(); -- 현재 사용하는 db 출력

show tables; -- select * from table과 같음
drop table if exists emp;

create table emp (
	empno numeric(4), -- 자릿수 지정 (기본 : 38자리)
    ename varchar(20) not null,
    nickname varchar(20), -- null 포함 가능, 유일해야 함
    sal numeric(7, 2),
    hiredate datetime default now(),
    comm numeric(7, 2) default 0,
    primary key (empno),
    unique (nickname),
    check (sal > 0)
);

select *
	from emp;
    
insert into emp (empno, ename, nickname, sal)
	values (1000, 'hong', 'hhong', 9000);

drop table if exists emp;
--	  major 테이블 (mCode; 시퀀스를 순차번호pk, mName, mOffice)
create table major (
	mCode int primary key auto_increment, -- auto_increment일 경우는 무조건 int!
    mName varchar(20),
    mOffice varchar(30)
);

insert into major (mName, mOffice)
	values ('컴공', '707호');

insert into major (mName, mOffice)
	values ('경영', '705호');
    
insert into major (mName, mOffice)
	values ('빅데이터', '701호');
    
insert into major (mName, mOffice)
	values ('기계', '702호');

select *
	from major;

--	  student 테이블 (sNo, sName, mCode;foreign key)
create table student (
	sNo int primary key,
    sName varchar(20),
    mCode int references major (mCode)
);

insert into student
	values (1111, '홍', 1);

insert into student
	values (1112, '김', (select mCode from major where mName = '경영'));

insert into student
	values (1113, '박', 5);

select *
	from student s, major m
    where s.mCode = m.mCode;

select *
	from student s left join major m
    on s.mCode = m.mCode;
    
drop table if exists student;
drop table if exists major;

create table major (
	mCode int auto_increment,
    mName varchar(20),
    mOffice varchar(50),
    primary key (mCode)
);

insert into major (mName, mOffice)
	values ('컴공', '707호');
    
insert into major (mName, mOffice)
	values ('빅데이터', '706호');
    
insert into major (mName, mOffice)
	values ('경영', '705호');
    
insert into major (mName, mOffice)
	values ('기계', '704호');

select *
	from major;

create table student (
	sNo numeric(4),
    sName varchar(20),
    mCode int,
    primary key (sNo),
    foreign key (mCode) references major (mCode)
);

insert into student
	values (1001, '호', 5);

insert into student
	values (1001, '호', 1);
    
insert into student
	values (1002, '홍', 2);

select *
	from student s, major m
    where s.mCode = m.mCode;
    
select *
	from student s right outer join major m
    on s.mCode = m.mCode;


--	★ JAVA 시간과 PYTHON 시간에 쓸 테이블과 데이터 생성하기
drop table if exists personal;
drop table if exists division;

create table division (
	deptno int, -- 부서번호
    dname varchar(20), -- 부서명
    dtel varchar(20), -- 부서전화번호
    position varchar(20), -- 부서위치
    primary key (deptno)
);

select *
	from division;
    
create table personal (
	pno int, -- 사번
    pname varchar(20) not null, -- 사원명
    job varchar(20) not null, -- 직책
    mgrno int, -- 상사의 사번
    startdate date, -- 입사일
    pay int, -- 급여
    bonus int, -- 상여금
    deptno int,
    primary key(pno),
    foreign key(deptno) references division(deptno)
);

select *
	from personal;

insert into division
	values (10, 'finance', '02-555-5555', '신촌');

insert into division
	values (20, 'research', '02-665-5555', '용산');

insert into division
	values (30, 'sales', '02-575-5555', '강남');

insert into division
	values (40, 'marketing', '02-555-4444', '김포');

select *
	from division;

insert into personal
	values (1111,'smith','manager', 1001, '1990-12-17', 1000, null, 10);

insert into personal 
	values (1112,'ally','salesman',1116,'1991-02-20',1600,500,30);

insert into personal 
	values (1113,'word','salesman',1116,'1992-02-24',1450,300,30);

insert into personal 
	values (1114,'james','manager',1001,'1990-04-12',3975,null,20);

insert into personal 
	values (1001,'bill','president',null,'1989-01-10',7000,null,10);

insert into personal 
	values (1116,'johnson','manager',1001,'1991-05-01',3550,null,30);

insert into personal 
	values (1118,'martin','analyst',1111,'1991-09-09',3450,null,10);

insert into personal 
	values (1121,'kim','clerk',1114,'1990-12-08',4000,null,20);

insert into personal 
	values (1123,'lee','salesman',1116,'1991-09-23',1200,0,30);

insert into personal 
	values (1226,'park','analyst',1111,'1990-01-03',2500,null,10);
commit;

select *
	from personal;

--	★ 연습문제
-- 1. 사번, 이름, 급여를 출력
select pno, pname, pay
	from personal;

-- 2. 급여가 2000~5000 사이 모든 직원의 모든 필드
select *
	from personal
    where pay between 2000 and 5000;

-- 3. 부서번호가 10또는 20인 사원의 사번, 이름, 부서번호
select pno, pname, deptno
	from personal
    where deptno in(10, 20);

-- 4. 보너스가 null인 사원의 사번, 이름, 급여 급여 큰 순정렬
select pno, pname, pay
	from personal
    where bonus is null
    order by pay desc;

-- 5. 사번, 이름, 부서번호, 급여. 부서코드 순 정렬 같으면 PAY 큰순
select pno, pname, deptno, pay
	from personal
    order by deptno, pay desc;

-- 6. 사번, 이름, 부서명
select pno, pname, dname
	from division d, personal p
    where d.deptno = p.deptno;

-- 7. 사번, 이름, 상사이름
select w.pno, w.pname worker, m.pname manager
	from personal w, personal m
    where w.mgrno = m.pno;

-- 8. 사번, 이름, 상사이름(상사가 없는 사람도 출력)
select w.pno, w.pname worker, m.pname manager
	from personal w left outer join personal m
    on w.mgrno = m.pno;
    
select w.pno, w.pname, if(m.pname is null, '상사 없음', m.pname) manager
	from personal w left outer join personal m
    on w.mgrno = m.pno;

-- 9. 이름이 s로 시작하는 사원 이름
select pname
	from personal
    where pname like 's%';

select pname
	from personal
    where substr(pname, 1, 1) = 's';

select pname
	from personal
    where instr(pname, 's') = 1;

-- 10. 사번, 이름, 급여, 부서명, 상사이름
select w.pno, w.pname worker, w.pay, dname, m.pname manager
	from division d, personal w left outer join personal m
						on w.mgrno = m.pno
    where w.deptno = d.deptno;

select w.pno, w.pname, w.pay, dname, m.pname
	from personal w, personal m, division d
    where w.deptno = d.deptno && w.mgrno = m.pno;

-- 11. 부서코드, 급여합계, 최대급여
select deptno, sum(pay), max(pay)
	from personal
    group by deptno;

-- 12. 부서명, 급여평균, 인원수
select dname, round(avg(pay), 2), count(*)
	from personal p, division d
    where p.deptno = d.deptno
    group by dname;

-- 13. 부서코드, 급여합계, 인원수 인원수가 4명 이상인 부서만 출력
 select deptno, sum(pay), count(*)
	from personal
    group by deptno
    having count(*) >= 4;
 
-- 14. 사번, 이름, 급여 회사에서 제일 급여를 많이 받는 사람
select pno, pname, pay
	from personal
    where pay = (select max(pay) from personal);

-- 15. 회사 평균보다 급여를 많이 받는 사람 이름, 급여, 부서번호
select pname, pay, deptno
	from personal
    where pay > (select avg(pay) from personal);

-- 16. 15번에 부서명을 추가하고 부서명순 정열 같으면 급여 큰순
select pname, pay, p.deptno, dname
	from personal p, division d
    where pay > (select avg(pay) from personal) and p.deptno = d.deptno
    order by dname, pay desc;

-- 17. 자신이 속한 부서의 평균보다 많인 받는 사람의 이름, 금여, 부서번호, 반올림한 해당부서평균
select pname, pay, e.deptno, round(avgpay, 2) avgpay_
	from personal e, (select deptno, avg(pay) avgpay
						from personal
                        group by deptno) f
	where e.deptno = f.deptno and pay > avgpay;

select pname, pay, deptno, round((select avg(pay)
									from personal
                                    where deptno = p.deptno)) avgsal
	from personal p
    where pay > (select avg(pay)
					from personal
                    where deptno = p.deptno);

-- 18. 입사가 가장 빠른 사람의 이름, 급여, 부서명
select pname, pay, dname
	from personal p, division d
    where p.deptno = d.deptno
		and startdate = (select min(startdate) from personal);

-- 19. 이름, 급여, 해당부서평균
select pname, pay, round(avgpay, 2) depavg
	from personal e, (select deptno, avg(pay) avgpay
						from personal
                        group by deptno) f
	where e.deptno = f.deptno;

select pname, pay, (select avg(pay) from personal where deptno = p.deptno) diviavg
	from personal p;
    
-- 20. 이름, 급여, 부서명, 해당부서평균
select e.pname, pay, dname, round(avgpay, 2) depavg
	from personal e, division d, (select deptno, avg(pay) avgpay
						from personal
                        group by deptno) f
	where e.deptno = d.deptno and e.deptno = f.deptno;
    
select pname, pay, dname, (select avg(pay) from personal where deptno = p.deptno) diviavg
	from personal p, division d
    where p.deptno = d.deptno;
    
select * from personal;

alter user 'root'@'localhost'
	identified with mysql_native_password
    by 'mysql';





















