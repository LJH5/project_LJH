-- apple 고객이 주문한 제품들의 가격을 보여주는 확인 
select 주문번호, 주문고객, (수량*단가) as '가격' from 주문 
	join 제품
		on 주문제품=제품번호
			where 주문고객 = 'apple';
            
select * from 주문;

-- 그냥만두가 판매된 개수를 확인

select 제품명, sum(수량) as '판매된 개수' from 주문 
	join 제품
		on 주문제품=제품번호
			where 제품명='그냥만두';