-- cgv 영화 애매 시스템을 구축하기 위한 db를 설계하세요

CREATE TABLE `movie` (
	`mv_num`	int	NOT NULL auto_increment,
	`mv_name`	varchar(30)	NOT NULL,
	`mv_date`	datetime	NOT NULL,
	`ma_age`	varchar(3)	NOT NULL default 'all',
	`mv_dir_name`	VARCHAR(30)	NOT NULL,
    primary key(mv_num)
);

CREATE TABLE `ticketing` (
	`ti_num`	int	NOT NULL auto_increment,
	`ti_mv_name`	varchar(30)	NOT NULL,
	`ti_time`	date	NOT NULL,
	`ti_place`	varchar(10)	NOT NULL,
	`ti_seat`	varchar(5)	NOT NULL,
    primary key(ti_num),
    foreign key (ti_mv_name) references movie(mv_name)
);


