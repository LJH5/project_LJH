-- 고객명단에 고객들의 등급만 확인
-- select 등급 from 고객;

-- [all/distinct]
-- select distinct 등급 from 고객;
-- select distinct 등급 from exemple.고객;

-- 고객의 등급을 확인(고객아이디, 등급)
-- select 고객아이디, 등급 from 고객;

-- 검색 결과의 속성 이름을 변경하는 as, 검색 결과만 변경
-- select 고객아이디 as '아이디', 등급 from 고객;

-- 아이디가 apple인 고객의 주문내역을 확인
-- select * from 주문 where 주문고객 ='apple';

-- 제품명이 p01인 제품이 주문된 내역을 확인
-- select * from 주문 where 주문제품 = 'p01';

-- 제조업체가 한빛제과인 제품의 목록을 확인
-- select 제품명 from 제품 where 제조업체 = '한빛제과';

-- 제품을 5개 이상 주문한 고객의 아이디를 확인
-- select distinct 주문고객 as '아이디' from 주문 where 수량 >= 5;

-- 단가가 2000원 이상 3000원 이하인 제품명을 확인
-- select 제품명, 단가 from 제품 where 단가 >=2000 and 단가 <=3000;

-- like
-- select * from 고객 where 고객이름 like '오';

-- 고객의 이름이 3글자인 고객의 리스트를 확인
-- select * from 고객 where 고객이름 like '___';

-- 고객의 성이 김씨인 고객의 리스트를 확인
-- select * from 고객 where 고객이름 like '김%';

-- 속성 값이 null인지 아닌지를 확인할 때 is null 또는 is not null을 이용
-- 나이가 null로 저장된 고객의 이름을 확인
-- select 고객이름 from 고객 where 나이 is null;
-- 나이가 null이 아닌 고객의 이름을 확인
-- select 고객이름 from 고객 where 나이 is not null;

-- 정렬은 order by 속성명1 [asc|desc], 속성명2[asc|desc], ... 로 정렬할 수 있다. where과는 별개
-- 고객을 고객 이름순으로 정렬
-- select * from 고객 order by 고객이름 desc;
-- 고객의 등급을 기준으로 정렬
-- select * from 고객 order by 등급;
-- 고객의 등급을 기준으로 정렬한 후 이름순으로 정렬
-- select * from 고객 order by 등급, 고객이름;

-- count: 속성값의 개수, max/min: 속성값들의 최대/최소, sum: 속성값들의 합, avg: 속성값들의 평균
-- 가입된 고객의 수
-- select count(고객아이디) from 고객;
-- select count(*) from 고객;
-- 가입된 고객 중 최고령자의 나이
-- select max(나이) from 고객;
-- 가입된 고객 중 최연소자의 나이
-- select min(나이) from 고객;
-- 판매된 제품수(총 판매 수량)
-- select sum(수량) as '판매량' from 주문;
-- 제품의 평균가격
-- select avg(단가) as 평균가격 from 제품; 
-- 아이디가 apple인 회원의 평균 주문량을 확인
-- select avg(수량) as 'apple의 평균 주문량' from 주문 where 주문고객 = 'apple';

-- group by는 where절 다음에 order by 전에 나와야 한다.
-- 주문 제품별 총 판매 수량
-- select 주문제품, sum(수량) as '판매 수량' from 주문 group by 주문제품;
-- 고객별 총 판매 수량
-- select 주문고객, sum(수량) as '주문 수량' from 주문 group by 주문고객;
-- 제조업체별 제품수와 제품들의 최고가와 최저가를 확인
-- select  제조업체, count(*) as '제품수', max(단가) as '최고가', min(단가) as '최저가' from 제품 group by 제조업체;
-- having은 그룹에서 조건을 걸고 싶을 때
-- 제품수가 3개 이상인 제조업체 확인
select 제조업체, count(*) as '제품수' from 제품 group by 제조업체 having count(*)>=3;