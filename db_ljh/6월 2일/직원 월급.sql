/*사원들의 월급을 돤리하는 시스템을 위핸 DB를 설계하세요
직급: 사원, 대리, 과장, 부장, 전무, 이사
월급: 직급별 기본급에 직급별 호봉에 따른 추가금
ex) 사원 기본급 200만, 호봉별 추가금 10만원 => 2년차 사원 홍길동의 월급은? 220만원
*/

CREATE TABLE `employee` (
	`em_num`	varchar(10)	NOT NULL,
	`em_name`	varchar(20)	NOT NULL,
	`em_class`	varchar(10)	NOT NULL,
	`em_rank`	int	NOT NULL,
    `em_salary` int NOT NULL,
    primary key(em_num)
    
);

CREATE TABLE `rule` (
	`ru_num`	varchar(10)	NOT NULL,
	`ru_base`	int	NOT NULL,
	`ru_plus`	int NOT	NULL,
    primary key(ru_num)
);



