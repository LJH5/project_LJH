-- 주문테이블에 주문내역이 추가되면 제품 테이블의 재고량이 변하는 트리거를 작성하세요
drop trigger if exists insert_order ;
delimiter //
create trigger insert_order after insert on `주문`
for each row
begin
	update `제품`
		set 재고량 = 재고량 - new.수량
        where 제품번호 = new.주문제품;
end //
delimiter ;

-- 트리거 실행문에서 조건문 사용해 보기
drop trigger if exists test_order;
delimiter //
create trigger test_order after insert on `주문`
for each row
begin
	/* if문 문법
    
	if 조건 then
		쿼리문;
	elseif 조건 then
		쿼리문;
	else
		쿼리문;
	end if;
    */
    
    /* 트리거 내에 변수 선언 및 저장
    -변수 선언(begin 바로 밑에 변수들을 모아서 선언하고 사용, 변수 선언시 변수명 앞에 _를 붙이면 속성과 구분하기 좋다)
    declare 변수명 타입 default 초기값;
    -변수 저장
    set 변수명 = 값;
    */
   
	declare _amount int default 0;
	declare _state varchar(10);
    set _amount = 10;
    set _amount = (select count(*) from 주문);
    if _amount > 10 then
		set _state = '많다';
	elseif _amount > 5 then
		set _state = '적절';
	else
		set _state = '적음';
	end if;
end //
delimiter ;

