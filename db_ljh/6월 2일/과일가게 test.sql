insert into fruit
values('apple', 10000, 'A과수원',100);

select * from buy;

insert into buy(bu_fr_name, bu_rate, bu_date, bu_total)
values('apple', 100, '2021-06-01', 10000000);

drop trigger if exists insert_buy ;
delimiter //
create trigger insert_buy after insert on buy
for each row
begin
	update fruit
		set ft_stock = ft_stock + new.bu_rate
        where fr_name = new.bu_fr_name;
end //
delimiter ;

drop trigger if exists insert_sale ;
delimiter //
create trigger insert_sale after insert on sale
for each row
begin
	update fruit
		set ft_stock = ft_stock - new.sa_rate
        where fr_name = new.sa_fr_name;
end //
delimiter ;