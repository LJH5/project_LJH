/* 강사님 방법
과일
 과일명(기본키), 가격, 단위(구매/판매 단위는 같아야함), 재고량
 
거래
 거래번호(기본키), 과일명(외래키), 구분(구매/판매), 수량, 날짜, 판매가격
 current_timestamp: 현재 시간 출력, datetime만 가능
 */
 
 create database if not exists fruit_shop2;
 use fruit_shop2;
 
 CREATE TABLE if not exists `fruit` (
	`fr_name`	varchar(15)	NOT NULL,
	`fr_price`	int	NOT NULL default 0,
	`fr_unit`	varchar(10)	NOT NULL default 'box',
	`fr_amount`	int	NOT NULL default 0,
    primary key(fr_name)
);

CREATE TABLE if not exists `trade` (
	`tr_num`	int	NOT NULL auto_increment,
	`tr_type`	varchar(4)	NOT NULL default 'sell',
	`tr_amount`	int	NOT NULL default 0,
	`tr_price`	int	NOT NULL default 0,
	`tr_date`	datetime	NOT NULL default current_timestamp,
	`tr_fr_name`	varchar(15)	NOT NULL,
    primary key(tr_num),
    foreign key(tr_fr_name) references fruit(fr_name)
);
-- 사과가 입고되기 위해서 fruit 테이블에 사과가 있어야함
-- insert into fruit values('사과', 10000,'box',0);

/* 사과 100상자 입고되었다. 상자당 가격은 10000원
insert into trade(tr_type, tr_amount, tr_price, tr_fr_name) values('buy', 100, 1000000, '사과');
update fruit set fr_amount = fr_amount + 100 where fr_name = '사과';
*/
/* 손님이 사과 1상자를 상자당 20000원에 구매를 했다
insert into trade(tr_type, tr_amount, tr_price, tr_fr_name) values('sell', 1, 20000, '사과');
update fruit set fr_amount = fr_amount - 1 where fr_name = '사과';
*/
-- 오늘 총 판매액
select sum(tr_price) as '판매액' from trade where tr_type = 'sell' and tr_date like '2021-06-02%'; 
-- 총 매출액
/* case when 사용법
case when 조건1 then 반환값
when 조건2 then 반환값
else 실행 end as 속성명
*/
select
	sum(case when tr_type = 'buy' then -tr_price
	else tr_price end) as '총 매출액' 
    from trade;
    
-- 트리거를 사용하여 재고량을 자동으로 관리
drop trigger if exists insert_trade;
delimiter //
create trigger insert_trade after insert on trade
for each row 
begin
	if new.tr_type = 'buy' then
		update fruit set fr_amount = fr_amount + new.tr_amount
			where fr_name = new.tr_fr_name;
	else
		update fruit set fr_amount = fr_amount - new.tr_amount
			where fr_name = new.tr_fr_name;
    end if;
end //
delimiter ;

-- insert into trade(tr_type, tr_amount, tr_price, tr_fr_name) values('sell', 10, 200000, '사과');

-- 없는 과일이 입고되는 경우 fruit 테이블에 새로운 과일을 추가하는 프로시저
drop procedure if exists 프로시저명;
delimiter //
create procedure insert_buy(
	in _name varchar(15),
    in _amount int,
    in _price int,
    in _sell_price int
)
begin
	declare _count int default 0; 
    set _count = (select count(*) from fruit where fr_name = _name); 
    
    if _count = 0 then
		insert into fruit(fr_name, fr_price)
			values(_name, _sell_price); 
    end if;
		insert into trade(tr_type, tr_amount, tr_price, tr_fr_name)
			values('buy', _amount, _price, _name);
end //
delimiter ;
call insert_buy('포도', 100, 500000, 10000)

