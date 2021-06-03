-- 문제1. 달콤비스켓과 같은 제조업체에서 제조한 제품의 제품명과 단가를 검색
-- 방법1: 달콤비스켓의 제조업체를 검색 후 눈으로 확인, 이후 확인된 제조업체로 제품명, 단가를 검색 => 올바른 방법이 아님, 일일이 확인하고 직접 입력
select 제조업체 from 제품 where 제품명 = '달콤비스켓';
select 제품명, 단가 from 제품 where 제조업체 = '한빛제과';
-- 방법2: 서브쿼리
select 제품명, 단가 from 제품 where 제조업체 = (select 제조업체 from 제품 where 제품명 = '달콤비스켓');

-- 문제2. banana 고객이 주문한 제품의 제품명과 제조업체를 검색
-- 방법1: join
select 제품명, 제조업체 from 주문 join 제품 on 주문제품 = 제품번호 
	where 주문고객 = 'banana';
-- 방법2: 서브쿼리, in
select 제품명, 제조업체 from 제품
	where 제품번호 in (select 주문제품 from 주문 where 주문고객 = 'banana');
    
-- 문제3. banana 고객이 주문하지 않은 제품의 제품명과 제조업체를 검색
-- 방법1: join => banana고객이 아닌 고객이 주문한 제품, 잘못된 쿼리
select distinct 제품명, 제조업체 from 주문 join 제품 on 주문제품 = 제품번호 
	where 주문고객 <> 'banana';
-- 방법2: 서브쿼리, not in
select 제품명, 제조업체 from 제품
	where 제품번호 not in (select 주문제품 from 주문 where 주문고객 = 'banana');
    
-- 문제4. 대한식품이 제조한 모든 제품의 단가보다 비싼 제품의 제품명, 단가, 제조업체 검색
select 제품명, 단가, 제조업체 from 제품
	where 단가 > all(select 단가 from 제품 where 제조업체 = '대한식품');
    
-- 문제5. 2013년 3월 15일에 제품을 주문한 고객의 이름을 검색
-- 방법1: join
select 고객이름 from 고객 join 주문 on 고객아이디 = 주문고객
	where 주문일자 = '2013-03-15';
-- 방법2: 서브쿼리와 연산자(exists)
select 고객이름 from 고객 
	where exists ( select * from 주문 where 주문일자 = '2013-03-15' and 주문고객 = 고객아이디);