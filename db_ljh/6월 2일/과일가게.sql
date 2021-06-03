CREATE TABLE fruit (
	fr_name	varchar(20)	NOT NULL,
	fr_price int NOT NULL,
	ft_made_in varchar(50)	NOT NULL,
	ft_stock int NOT NULL,
    primary key(fr_name)
);

create table `account`(
	ac_num int auto_increment,
    ac_money int not null,
    primary key(ac_num)
);

CREATE TABLE sale (
	sa_num	int auto_increment,
	sa_fr_name varchar(20) NOT NULL,
	sa_rate	int	NOT NULL,
	sa_date	datetime NOT NULL,
    sa_ac_money int not null,
    primary key(sa_num),
    foreign key (sa_fr_name) references fruit(fr_name),
	foreign key (sa_ac_money) references `account`(ac_num)
);

CREATE TABLE buy (
	bu_num int auto_increment,
	bu_fr_name varchar(20) NOT NULL,
	bu_rate	int	NOT NULL,
	bu_date	datetime NOT NULL,
    bu_ac_money int not null,
    primary key(bu_num),
    foreign key (bu_fr_name) references fruit(fr_name),
    foreign key (bu_ac_money) references `account`(ac_num)
);


