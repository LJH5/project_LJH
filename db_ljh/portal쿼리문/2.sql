-- student 테이블에 학생정보 추가

insert into student(st_num, st_id, st_res_num, st_pw, st_dep, st_name)
	values('2020160001', 'abc123', '010527-3456789', 'abc123', '컴공', '가나');
    
insert into student(st_id, st_num, st_res_num, st_pw, st_dep, st_name)
	values('abc124', '2020160002',  '010528-3456789', 'abc124', '컴공', '가다');
desc student;    
-- 테이블 옆 속성이 생력된 경우 순서대로 입력해야 힌다.
insert into student()
	values('2020160003', 'abc',   '010529-3456789', 'abc', '컴공', '나다');
    
-- 여러행을 추가하는 경우
insert into student()
	values('2020160005', 'abc789',   '010101-3456789', 'abc789', '컴공', '아나바다'),
		('2020160006', 'abc555',   '010505-3456789', 'abc555', '컴공', '오오오');
select * from student;