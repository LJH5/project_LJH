update professor
	set
		pr_pw = 'abc123';
        
-- P2000135001 교수님의 이름을 고길동으로 수정
update professor set pr_name = '고길동' where pr_num = 'P2000135001';
select * from professor;

-- delete는 내용이 모두 삭제 되기 때문에 사용을 자제하고 필요시 조심해서 사용

create table if not exists board(
	bd_num int auto_increment,
	bd_title varchar(50) not null,
	bd_is_del char(1) not null default 'N',
	primary key(bd_num)
);

insert into board(bd_title)
	values('제목1'),('제목2'),('제목3'),('제목4'),('제목5');
select * from board;
-- 1번 게시글 삭제
update board set bd_is_del = 'Y' where bd_num = 1;
select * from board where bd_is_del = 'N';