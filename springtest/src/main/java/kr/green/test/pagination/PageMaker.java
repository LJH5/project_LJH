package kr.green.test.pagination;

import lombok.*;

@Data
public class PageMaker {
	private int totalCount;		//총 게시물의 개수
	private int startPage;  	//시작 페이지(1페이지) 
	private int endPage;		//끝 페이지
	private boolean prev;		//이전
	private boolean next;		//다음
	private int displayPageNum;	//보여줄 페이지의 개수 예)3이라면 =>  이전 1 2 3 다음, 5라면 => 이전 1 2 3 4 5 다음 
	private Criteria criteria;
	
	public void calcData() {
		endPage = (int)(Math.ceil(criteria.getPage()/(double) displayPageNum)*displayPageNum);
		startPage = (endPage - displayPageNum)+1;
		int tempEndPage = (int)(Math.ceil(totalCount/(double)criteria.getPerPageNum()));
		if(endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		prev = startPage == 1 ? false : true;
		next = endPage * criteria.getPerPageNum() >= totalCount ? false:true;
	}
	public PageMaker() {}
	
	public PageMaker(int totalCount, int displayPageNum, Criteria criteria) {
		this.totalCount = totalCount;
		this.displayPageNum = displayPageNum;
		this.criteria = criteria;
		calcData();
	}
	
}
