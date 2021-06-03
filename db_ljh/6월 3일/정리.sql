/* 요구사항명세서를 통해 ERD 작성하는 과정이 DB 설계
SQL
 - DDL
	-create
    -drop
    -alter
 - DML(CRUD)
	-insert
    -select
    -update
    -delete
 - DCL
	-turncate: 테이블을 초기화
    
-delete와 turncate를 이용하여 전체 튜플을 삭제하는 경우 비교
	delete를 이용하여 데이터를 삭제하면 auto_increment를 가지는 속성이 있는 경우 기존 값을 이어서 증가
	turncate를 이용하여 데이터를 삭제하면 auto_increment를 가지는 속성이 있는 경우 1부터 시작
    turncate는 전체를 한 번에 삭제하지만 delete는 한 행씩 삭제해서 전체를 삭제하기 때문에  delete가 느리다
    전체 삭제는 truncate, 일부 삭제는 delete를 사용
    
select [all | distinct] 속성 from 테이블
[where 조건]
[group by 속성]
[having 조건]
[order by [asc | desc]]
[limit 시작번지, 개수 | limit 개수]

join: 여러 테이블들을 연결하여 원하는 검색을 함
	-주로 외래키를 이용함(왜래키의 참조무결성)
    
insert into 테이블[(속성1, 속성2,...)] values(값1, 값2,...)[,(값, 값,...)];
update 테이블 set 속성 = 값 [where 조건];
delete from 테이블 [where 조건];

키
 -슈퍼키(유일성)
 -후보키(유일성, 최소성)
 -기본키(유일성, 최소성): primary key
 -대체키(유일성, 최소성): unique, 기본키가 되지못한 후보키
 -외래키: 다른 테이블의 기본키 값이나 null 가지는 키
 
프로시저

트리거
 -튜플이 추가/수정/삭제 되었을 때 다른 테이블에 있는 값이 변경되면 사용
 -해당 동작이 자동으로 실행되게할 때 사용
DB 복습
1. DB 설계(ERD): 작은 규모의 시스템
*/

insert into t1(contents) 
	values ('1'),('2'),('3'),('4'),('5'),('6'),('7'),('8'),('9'),('10'),('11'),('12'),('13'),('14'),('15');

SELECT * FROM test.t1 limit 10, 5;

