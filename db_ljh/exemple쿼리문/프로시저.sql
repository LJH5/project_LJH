/* 프로시저
drop procedure if exists 프로시저명;
delimiter 기호
create procedure 프로시저명(
	{in | out} 변수명1,
    {in | out} 변수명2,
    ...
)
begin
	구현;
end 기호
delimiter ;
*/

drop procedure if exists addOrder;
delimiter //
create procedure addOrder(
	in _id varchar(20), 
    in _product char(3), 
    in _amount int,
    in _address varchar(30),
    in _date varchar(20)
)
begin
	declare _count int default 0; 
    declare _order_num char(3);
    set _count = (select count(*) from 주문) + 1;
    set _order_num = concat('o',_count);
    insert into `주문` 
		values(_order_num,_id,_product,_amount,_address,_date);
    select * from `주문`;
end //
delimiter ;
call addOrder('apple','p01',15,'충북 청주시','2021-06-01');