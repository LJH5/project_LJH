package kr.green.test.pagination;

public class PageMaker {
	private int totalCount;		//총 게시물의 개수
	private int startPage;  	//시작 페이지(1페이지) 
	private int endPage;		//끝 페이지
	private boolean prev;		//이전
	private boolean next;		//다음
	private int displayPageNum;	//보여줄 페이지의 개수 예)3이라면 =>  이전 1 2 3 다음, 5라면 => 이전 1 2 3 4 5 다음 
	private Criteria criteria;
	
	/* endPage, startPage, prev, next 값 계산 */
	public void calcData() {
		/* starPage와 endPage는 현재 페이지 정보인 criteria와 displayPageNum을 이용하여 계산
		 * displayPageNum이 10이고 현재 페이지가 3페이지면 startPage = 1, endPage = 10이 되도록 계산 */
		endPage = (int)(Math.ceil(criteria.getPage()/(double) displayPageNum)*displayPageNum);
		// ceil은 올림 현재 페이지가 11페이지 이면 11/10 => 1.1 여기서 올림 => 2 여기서 *10 => 20 따라서 마지막 페이지는 20페이지
		startPage = (endPage - displayPageNum)+1;
		/* 총 콘텐츠 갯수를 이용하여 마지막 페이지 번호를 계산 */
		int tempEndPage = (int)(Math.ceil(totalCount/(double)criteria.getPerPageNum()));
		
		/* 현재 페이지에 계산된 현재 페이지메이커의 마지막 페이지 번호와 실제 마지막 페이지 번호를 비교하여
		 * 작은 값이 마지막 페이지 번호가 됨 */
		if(endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		/* 현재 페이지메이커에 시작페이지가 1페이지면 prev가 없어야 함 */
		prev = startPage == 1 ? false : true;
		/* 현재 페이지메이커에 마지막 페이지에 컨텐츠의 마지막이 포함되어 있으면 next가 없어야 함 */
		next = endPage * criteria.getPerPageNum() >= totalCount ? false:true;
	}
	/* getter and setter */
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	public Criteria getCriteria() {
		return criteria;
	}
	public void setCriteria(Criteria criteria) {
		this.criteria = criteria;
	}
	@Override
	public String toString() {
		return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
				+ prev + ", next=" + next + ", displayPageNum=" + displayPageNum + ", criteria=" + criteria + "]";
	}
	
}
