/* 
DCL(데이터 제어어)
grant: 특정 데이터베이스 사용자에게 권한 부여
revoke: 특정 데이터베이스 사용자에게 권한 회수
commit: 트렌젝션의 작업이 정상적으로 완료됨을 알려줌
rollback: 트렌젝션의 작업이 비정상적으로 완료 되었을 때 복구
*/

/*
정규화: 데이터베이스를 효율적으로 관리하기 위해 데이터 중복을 재거하면서 무결성을 유지하디 위한 기법(쪼개기)
제1정규화: 속성의 값이 원자값을 갖도록 테이블을 분해
제2정규화: 완전함수 종속을 만족하도록 테이블을 분해, 기본키의 부분집합으로 속성을 검색하면 안된다.
제3정규화: 이행종속을 제거하도록 체이블을 분해, 이행종속은 A -> B, B -> C 일때 A -> C 가 성립

반정규화: 정규화로 테이블이 너무 많아서 검색 시 너무 많은 join이 필요한 경우
*/
/* 소녀시대가 부른 노래를 검색, sing 테이블에 sn_si_name을 추가*/

select so_title as '노래 제목' from sing 
	join `source`
		on so_num = sn_so_num
    where sn_si_name='소녀시대';

-- 소녀시대의 3집앨범의 수록곡들을 확인하기 위한 쿼리문, list 테이블에 li_si_name을 추가
select so_title as '3집 수록곡' from `source`
    join `list`
		on so_num = li_so_num
	join album
		on al_num = li_al_num
    where li_si_name='소녀시대' and al_title like '%3집%';