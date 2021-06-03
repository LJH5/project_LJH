/* 테이블 생성
직원: 직원번호, 이름, 직급, 호봉, 월급
직급: 기본급, 호봉추가금
*/

create database company;
use company;

create table if not exists salary(
	sa_level char(2) not null,
    em_base_salary int not null default 0,
    em_ass_salary int not null default 0,
    primary key(sa_level)
);

create table if not exists employee(
	em_num int not null auto_increment,
    em_name varchar(15) not null,
    em_sa_level char(2) not null,
    em_year int not null default 1,
    em_salary int not null default 0,
    primary key(em_num),
    foreign key(em_sa_level) references salary(sa_level)
);





drop procedure if exists insert_payments;
delimiter //
create procedure insert_payments(
	in _num int
)
begin
	declare _price int default 0;
    set _price = (select em_salary from employee where em_num = _num);
    set _price = price * 0.9;
    insert into payments(pa_em_num, pa_price) values(_num, _price);
end //
delimiter ;
call insert_payments(1);