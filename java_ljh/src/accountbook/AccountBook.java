package accountbook;

public class AccountBook {
	//멤버변수
	private Item [] ABP;
	private int cnt;
	private int total;
	//멤버메소드
	
	/* 기능	 : 내역(Item)이 주어지면 가계부 내용을 추가하는 기능
	 * 매개변수: 
	 * 리턴타입: void
	 * 메소드명: insertABP
	 */
	
	/* 기능	 : 가계부의 수입/지출 목록을 확인
	 * 매개변수: 
	 * 리턴타입: void
	 * 메소드명: checkABP
	 */
	
	public void checkABP() {
		/*
		System.out.println("수입/지출: "+);
		System.out.println("날짜: "+);
		System.out.println("결제타입: "+);
		System.out.println("분류: "+);
		System.out.println("비용: "+);
		System.out.println("내용: "+);
		*/
	}
	/* 기능	 : 가계부의 지출 목록을 확인
	 * 매개변수: 
	 * 리턴타입: void
	 * 메소드명: checkOutABP
	 */
	
	/* 기능	 : 가계부를 내용을 수정, Item에서 정의
	 */
	
	/* 기능	 : 가계부를 내용을 삭제
	 * 매개변수: 
	 * 리턴타입: void
	 * 메소드명: deleteABP
	 */
	
	/* 기능	 : 가계부의 수입 목록을 확인
	 * 매개변수: 
	 * 리턴타입: void
	 * 메소드명: checkInABP
	 */

	public Item[] getABP() {
		return ABP;
	}

	public void setABP(Item[] aBP) {
		ABP = aBP;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}
	
	
	
}
