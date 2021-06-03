/*
트리거 
delimiter 기호
create trigger 트리거명 
{before | after} {insert | update | delete} on 테이블명
for each row
begin
	코드 작성;
end 기호
delimiter ;
delimiter 기호: 문장의 마지막을 알려주는 ; 기호 대신 지정한 기호로 대체
*/

use portal;
/*학생이 강의를 수강신청하면 해당 강의의 현재 정원이 1증가하는 트리거*/
drop trigger if exists insert_course;
delimiter //
create trigger insert_course after insert on course
for each row
begin
	update class
		set cl_now_count = cl_now_count + 1
        where cl_code = new.co_cl_code;
end //
delimiter ;
-- 해당 데이터베이스의 트리거 확인
show triggers;