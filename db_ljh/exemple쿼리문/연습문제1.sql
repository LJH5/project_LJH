-- 컴퓨터 학과의 교수님 수
-- select count(*) as '교수님 수' from professor where pr_dep = '컴퓨터' group by pr_dep;
-- select count(*) as '교수님 수' from professor group by pr_dep having pr_dep='컴퓨터';

-- 교수번호가 P2002140001인 교수님이 강의하는 강의 리스트 확인
-- select * from class where cl_pr_num = 'P2002140001';

-- 학점이 2학점 이상인 강의 리스트를 확인
-- select * from class where cl_point >= 2;

-- 월요일에 수업하는 강의 리스트
-- select * from class where cl_schedule like '%월%';

-- 2020학번을 학생들을 확인
-- select * from student where st_num like '2020%';

-- 2020135001 학생이 2021MSC004 강의를 수강했을 때 사용해야 하는 쿼리문
-- insert into course(co_st_num, co_cl_code) values('2020135001','2021MSC004');

-- 2020135001 학생이 수강한 강의 수 확인
-- select count(*) as '수강한 강의 수' from course where co_st_num = '2020135001';

-- 2020135001 학번 학생이 2021년도에 수강한 강의 수 학인
-- select count(*) as '2021년도 수강한 강의 수' from course where co_st_num = '2020135001' and co_cl_code like '2021%';

-- 2020135001 학생이 수강한 강의 제목을 하나의 테이블로 확인할 수 있다(x) 
-- 2020135001 학생이 수강한 강의 코드를 하나의 테이블로 확인할 수 있다(o) => course 테이블에서 강의 코드 확인가능

-- select 테이블1.속성1, 테이블1.속성2,...테이블2.속성1 from 테이블1, 테이블2 where 조건
-- 2020135001 학생이 수강한 강의 제목을 확인하기 위해서 course(수강 정보), class(강의 제목)
-- select co_st_num as '학번' ,cl_title as '강의명' from course, class where co_cl_code = cl_code and co_st_num ='2020135001';

-- 교수번호가 P2000135001인 교수님의 강의를 들은 학생들의 명단
-- select st_name as '학생명단' from course, class, student where co_cl_code = cl_code and co_st_num = st_num and cl_pr_num = 'P2000135001';

-- select 속성1, 속성2,.. from 테이블1 join 테이블2 on 테이블1.외래키=테이블2.기본키;
-- 2020135001 학생이 수강한 강의 제목을 확인하는 코드를 join을 이용하여 확인
select course.co_st_num as '학번', class.cl_title as '강의명' from course 
	join class 
		on course.co_cl_code=class.cl_code
			where course.co_st_num = '2020135001'; 
-- join할 때 두 테이블의 속성명이 겹치지 않는 경우 속성 이름 앞에 테이블 명을 생략해도 된다.            
            
-- 네트워크를 강의하는 교수님의 이름을 확인하는 코드
select pr_name as '교수명' from class
	join professor
		on pr_num=cl_pr_num
			where cl_title = '네트워크';

