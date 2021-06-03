-- 소녀시대가 부른 노래를 검색할 때 필요한 쿼리문
select so_title as '노래 제목' from singer
	join sing 
		on si_num = sn_si_num
	join `source`
		on so_num = sn_so_num
    where si_name='소녀시대';
    
-- 소녀시대의 멤버들을 검색하기 위한 쿼리문
select ar_name as '가수 이름' from singer
	join `member`
		on si_num = me_si_num
	join artist
		on ar_num = me_ar_num
	where si_name='소녀시대';
    
-- 소녀시대의 3집앨범의 수록곡들을 확인하기 위한 쿼리문
select so_title as '3집 수록곡' from singer
	join sing 
		on si_num = sn_si_num
	join `source`
		on so_num = sn_so_num
    join `list`
		on so_num = li_so_num
	join album
		on al_num = li_al_num
    where si_name='소녀시대' and al_title like '%3집%';
    


select so_title from (select * from singer  where si_name='소녀시대') as singer_search
	join sing 
		on si_num = sn_si_num
	join `source`
		on so_num = sn_so_num
    join `list`
		on so_num = li_so_num
	join album
		on al_num = li_al_num
    where al_title like '%3집%';
    

-- 노래 제목에 거짓말이 들어간 노래를 확인하는 쿼리문
select so_title from `source` where so_title like '%거짓말%';

-- 노래 제목 또는 가사에 거짓말이 포함된 노래를 확인하는 쿼리문
select so_title from `source` where so_title like '%거짓말%' or so_lyrics like '%거짓말%';

-- SM 소속 아티스트들의 목록을 확인하는 쿼리문
select ar_name as 'SM 소속' from artist where ar_agency = 'SM';

-- 아티스트 태연이 활동한 그룹들을 확인하는 쿼리문
select si_name from artist
	join `member`
		on ar_num = me_ar_num
	join singer
		on si_num = me_si_num
	where ar_name like '%태연%';
    
-- 가수 태연이 피처링한 노래를 확인하는 쿼리문 
select so_name from singer
	join sing
		on si_num = sn_si_num
	join `source`
		on so_num = sn_so_num
	where si_name like '%태연%' and sn_featuring = 'Y';