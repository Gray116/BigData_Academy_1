--	★ oracle에서의 단일행함수와 mysql에서의 단일행함수 차이
select pname, length(pname) -- mysql에서 length는 바이트 수
	from personal;

insert into personal
	values (1000, '홍길동', 'manager', 1001, curdate(), null, null, 40);

select concat(pname, '은 ', job, '이다') -- concat 매개변수를 계속 삽입 가능
	from personal;

--	숫자 관련된 함수는 거의 다 비슷하다
select round(34.5678, 1); -- from 절이 필요없다.

--	날짜 함수
select year(startdate), month(startdate), day(startdate)
	from personal;

select monthname(startdate), startdate
	from personal;

--	표시 형식 함수
select date_format(sysdate(), '%y년'); -- date_format에서 년도 두자리 추출(from절 필요x)
select date_format(sysdate(), '%Y년'); -- 년도 네자리 전부 추출

select date_format(sysdate(), '%m월'); -- 월이 두자리로 출력됨..01,02...
select date_format(sysdate(), '%M월'); -- 월이 영어로 출려됨..Jan..Feb..
select date_format(sysdate(), '%c월'); -- 월이 숫자 한자리로 출력

select date_format(sysdate(), '%e일'); -- 한자리부터 출력 
select date_format(sysdate(), '%d일'); -- 숫자 두자리 출력

select date_format(sysdate(), '%H시'); -- 24시간식
select date_format(sysdate(), '%h시'); -- 12시간식
select date_format(sysdate(), '%p'); -- 오전, 오후

select date_format(sysdate(), '%i분'); -- 00분부터 시작
select date_format(sysdate(), '%s초'); -- 초

select format(pay, 0) -- 3자리마다 콤마
	from personal;

select format(pay, 2) -- 3자리마다 콤마 + 소수점 두자리
	from personal;

--	시스템으로부터 현재 날짜와 시간
select sysdate();
select now();

select current_date(); -- 날짜만 가져옴
select curdate();

select current_time(); -- 시간만 가져옴
select curtime();

--	top-n 구문
select pname, pay
	from personal
    order by pay desc;

--	limit n = 1~n등까지
select pname, pay
	from personal
    order by pay desc
    limit 5;

--	limit n1, n2 = n1번째부터 n2개, 첫번째는 0부터 시작
select pname, pay
	from personal
    order by pay desc
    limit 5, 5; -- 6등부터 10등
    
select pname, pay
	from personal
    order by pay desc
    limit 3, 6; -- 4등부터 9등, 6~9등 -> 5, 4

-- personal 이름, 급여, 급여가 3000이상인지 여부
select pname, pay, if(pay >= 3000, '높다', '낮다')
	from personal;

commit;