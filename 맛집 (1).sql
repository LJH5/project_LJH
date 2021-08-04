CREATE TABLE `member` (
	`me_id`	varchar(15)	NOT NULL,
	`me_pw`	varchar(255)	NULL,
	`me_nickname`	varchar(20)	NULL,
	`me_picture`	varchar(1)	NULL,
	`me_name`	varchar(45)	NULL,
	`me_email`	varchar(45)	NULL,
	`me_phoneNum`	varchar(11)	NULL,
	`me_gender`	varchar(1)	NULL,
	`me_authority`	varchar(45)	NULL
);

CREATE TABLE `restaurant` (
	`rt_num`	int	NOT NULL,
	`rt_name`	VARCHAR(45)	NULL,
	`rt_address`	VARCHAR(255)	NULL,
	`rt_phoneNum`	VARCHAR(255)	NULL,
	`rt_type`	VARCHAR(255)	NULL,
	`rt_openTime`	VARCHAR(255)	NULL,
	`rt_menu`	VARCHAR(255)	NULL,
	`rt_me_id`	varchar(15)	NOT NULL,
	`rt_regDate`	VARCHAR(255)	NULL,
	`rt_upDate`	VARCHAR(255)	NULL
);

CREATE TABLE `recommend` (
	`rc_num`	int	NOT NULL,
	`rc_re_num`	int	NOT NULL,
	`rc_me_id`	varchar(15)	NOT NULL,
	`rc_type`	varchar(10)	NULL,
	`rc_state`	int	NULL
);

CREATE TABLE `image` (
	`im_num`	int	NOT NULL,
	`im_type`	varchar(10)	NULL,
	`im_number`	int	NULL,
	`im_name`	varchar(255)	NULL,
	`im_thumbnail`	varchar(1)	NULL
);

CREATE TABLE `review` (
	`re_num`	int	NOT NULL,
	`re_me_id`	varchar(15)	NOT NULL,
	`re_rt_num`	int	NOT NULL,
	`re_content`	lontext	NULL,
	`re_regDate`	datetime	NULL,
	`re_upDate`	datetime	NULL,
	`re_report`	int	NULL,
	`re_recommend`	int	NULL,
	`re_totalSc`	float	NULL,
	`sc_service`	int	NULL,
	`sc_mood`	int	NULL,
	`sc_tasty`	int	NULL,
	`sc_quantity`	int	NULL,
	`sc_clean`	int	NULL
);

CREATE TABLE `reply` (
	`rp_num`	int	NOT NULL,
	`rp_bo_num`	int	NOT NULL,
	`re_me_id`	varchar(15)	NOT NULL,
	`rp_content`	longtext	NULL,
	`rp_regDate`	datetime	NULL,
	`rp_upDate`	datetime	NULL
);

CREATE TABLE `favorites` (
	`fa_num`	VARCHAR(255)	NOT NULL,
	`fa_me_id`	varchar(15)	NOT NULL,
	`fa_rt_num`	int	NOT NULL
);

CREATE TABLE `board` (
	`bo_num`	int	NOT NULL,
	`bo_title`	VARCHAR(255)	NULL,
	`bo_me_id`	varchar(15)	NOT NULL,
	`bo_content`	longtext	NULL,
	`bo_regDate`	datetime	NULL,
	`bo_views`	int	NULL,
	`bo_type`	VARCHAR(45)	NULL
);

ALTER TABLE `member` ADD CONSTRAINT `PK_MEMBER` PRIMARY KEY (
	`me_id`
);

ALTER TABLE `restaurant` ADD CONSTRAINT `PK_RESTAURANT` PRIMARY KEY (
	`rt_num`
);

ALTER TABLE `recommend` ADD CONSTRAINT `PK_RECOMMEND` PRIMARY KEY (
	`rc_num`
);

ALTER TABLE `image` ADD CONSTRAINT `PK_IMAGE` PRIMARY KEY (
	`im_num`
);

ALTER TABLE `review` ADD CONSTRAINT `PK_REVIEW` PRIMARY KEY (
	`re_num`
);

ALTER TABLE `reply` ADD CONSTRAINT `PK_REPLY` PRIMARY KEY (
	`rp_num`
);

ALTER TABLE `favorites` ADD CONSTRAINT `PK_FAVORITES` PRIMARY KEY (
	`fa_num`
);

ALTER TABLE `board` ADD CONSTRAINT `PK_BOARD` PRIMARY KEY (
	`bo_num`
);

