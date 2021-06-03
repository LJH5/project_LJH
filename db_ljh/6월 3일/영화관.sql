CREATE TABLE `movie` (
	`mv_num`	int	NOT NULL,
	`mv_title`	varchar(30)	NULL,
	`mv_date`	datetime	NULL,
	`ma_age`	int	NULL,
	`mv_dir_name`	varchar(30)	NULL
);

CREATE TABLE `ticketing` (
	`ti_num`	int	NOT NULL,
	`mv_num`	int	NOT NULL,
	`Field2`	VARCHAR(255)	NULL,
	`ti_num2`	int	NOT NULL,
	`cu_id`	varchar(30)	NOT NULL,
	`se_num`	int	NOT NULL,
	`Field`	VARCHAR(255)	NULL,
	`ti_price`	int	NULL,
	`Field3`	VARCHAR(255)	NULL
);

CREATE TABLE `screen` (
	`sc_num`	int	NOT NULL,
	`sc_name`	varchar(10)	NULL
);

CREATE TABLE `customer` (
	`cu_id`	varchar(30)	NOT NULL,
	`cu_name`	varchar(30)	NULL,
	`cu_phone`	varchar(14)	NULL,
	`cu_age`	int	NULL
);

CREATE TABLE `seat` (
	`se_num`	int	NOT NULL,
	`se_name`	varchar(4)	NULL,
	`se_sc_num`	int	NOT NULL
);

CREATE TABLE `play` (
	`pl_mv_num`	int	NOT NULL,
	`pl_sc_num`	int	NOT NULL,
	`ti_num`	int	NOT NULL
);

CREATE TABLE `time` (
	`ti_num`	int	NOT NULL,
	`ti_mv_num`	varchar(30)	NOT NULL,
	`ti_time`	datetime	NULL
);



