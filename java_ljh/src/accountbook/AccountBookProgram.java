package accountbook;

import java.util.Scanner;

class AccountBookProgram {
	private Scanner sc = new Scanner(System.in);
	AccountBook2 book;
	
	/* 기능	 : 가계부 내용을 추가하는 기능
	 * 매개변수: 없음
	 * 리턴타입: void
	 * 메소드명: insert
	 */
	public void insert() {
		//가계부 정보를 입력(수입/지출, 날짜, 결제타입 , 분류, 비용 ,내용)
				System.out.println("가게부 정보를 입력하세요");	
				System.out.print("수입/지출: ");
				String type =sc.next();
				System.out.print("날짜: ");
				String date=sc.next();
				System.out.print("결제타입: ");
				String paymentType=sc.next();
				System.out.print("분류: ");
				String category=sc.next();
				System.out.print("비용: ");
				int cost=sc.nextInt();
				System.out.print("내용: ");
				String contents=sc.next();
				
	
				//가계부 생성
				Item tmpabp = new Item(type, date, paymentType, category, cost, contents);
				book.intsert(tmpabp);			
	}
	
	
	/* 기능	 : 가계부 내용을 수정하는 기능
	 * 매개변수: 없음
	 * 리턴타입: void
	 * 메소드명: update
	 */
	public void update() {
		System.out.print("수정할 내역의 번호를 입력하세요");
		int index =sc.nextInt();
		
		System.out.println("가게부 정보를 입력하세요");	
		System.out.print("수입/지출: ");
		String type =sc.next();
		System.out.print("날짜: ");
		String date=sc.next();
		System.out.print("결제타입: ");
		String paymentType=sc.next();
		System.out.print("분류: ");
		String category=sc.next();
		System.out.print("비용: ");
		int cost=sc.nextInt();
		System.out.print("내용: ");
		String contents=sc.next();
		
		Item tmpabp = new Item(type, date, paymentType, category, cost, contents);
		book.update(index, tmpabp);	
	}
	
	/* 기능 : 삭제할 내역의 번호를 입력받아 내역을 삭제하는 메소드
	 * 매개변수: 없음 
	 * 리턴타입: void
	 * 메소드명: delete
	 */
	public void delete() {
		System.out.print("삭제할 내역의 번호를 입력하세요: ");
		int index =sc.nextInt();
		
		book.delete(index);
	}

	/* 기능	 : 내역 전체를 상세 출력하는 메소드
	 * 매개변수: 없음 
	 * 리턴타입: void
	 * 메소드명: printItemListDetail
	 */
	public void printItemListDetail	() {
		book.printItemListDetail();
	}

	/* 기능	 : 내역 전체를 간략히 출력하는 메소드
	 * 매개변수: 없음 
	 * 리턴타입: void
	 * 메소드명: printItemListSimple
	 */
	public void printItemListSimple() {
		book.printItemListSimple();
	}
	
	/* 기능	 : 확인할 내역 번호를 입력받아 상세히 출력하는 메소드
	 * 매개변수: 없음 
	 * 리턴타입: void
	 * 메소드명: printItem
	 */
	public void printItem() {
		System.out.print("확인할 내역의 번호를 입력하세요: ");
		int index =sc.nextInt();
		
		book.printItem(index);
	}
	
	/* 기능	 : 가계부 금액을 츨력하는 메소드
	 * 매개변수: 없음 
	 * 리턴타입: void
	 * 메소드명: printTotal
	 */
	public void printTotal() {
		System.out.println("내역합계: "+ book.getTotal()+"원");
	}
	
	public static void menuPrint() {
		System.out.println("------메뉴------");
		System.out.println("1.가계부 입력");
		System.out.println("2.가계부 수정");
		System.out.println("3.가계부 삭제");
		System.out.println("4.가계부 상세 확인");
		System.out.println("5.가계부 간략 확인");
		System.out.println("6.가계부 내역 확인");
		System.out.println("7.가계부 총액 확인");
		System.out.println("8.프로그램 종료");
		System.out.println("---------------");
		System.out.print("메뉴를 선택하세요: ");
		
	}
	
	
	public void closeAccountBook() {
		System.out.println("프로그램을 종료합니다.");
		sc.close();
	}
}
