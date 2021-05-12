package Board;

import java.util.Scanner;

public class BoardTest {

	public static void main(String[] args) {
		/* 1. 게시글 등록
		 * 2. 게시글 수정
		 * 3. 게시글 삭제
		 * 4. 게시글 목록 확인
		 * 5. 게시글 상세 확인
		 * 6. 프로그램 종료
		*/
		//반복문을 이용하여 메뉴를 출력하고 메뉴를 선택하는 작업
		//선택한 메뉴가 1이면 게시글 등록이라고 출력
		//선택한 메뉴가 2이면 게시글 수정이라고 출력
		//선택한 메뉴가 3이면 게시글 삭제이라고 출력
		//선택한 메뉴가 4이면 게시글 목록 확인이라고 출력
		//선택한 메뉴가 5이면 게시글 상세 확인이라고 출력
		//선택한 메뉴가 6이면 프로그램 종료라고 출력
		//선택한 메뉴가 1~6이 아니면 잘못된 메뉴라고 출력
		
		int menu=0;
		int max=10;
		Scanner sc = new Scanner(System.in);
		Board []board = new Board[max];
		String title, contents, writer, registerDate, type;
		int num;
		int cnt=0; //저장된 게시글의 개수(등록할 때 저장할 번지)
		int views;
		
		
		Board tmpBoard;
		
		do {
			printMenu();
			menu=sc.nextInt();
			
			switch(menu) {
			case 1:	
				//게시글 정보 입력(제목, 작성자, 작성일, 내용)
				System.out.println("게시글 정보를 입력하세요.");	
				System.out.print("제목: ");
				title =sc.next();
				System.out.print("작성자: ");
				writer=sc.next();
				System.out.print("작성일: ");
				registerDate=sc.next();
				System.out.print("내용: ");
				contents=sc.next();
				
				//타입을 게시글로 지정, 번호는 배열의 번지를 이용
				type="게시글";
				num=cnt+1;
				
				//입력된 정보를 이용하여 게시글 생성
				tmpBoard = new Board(num, title, contents, writer, registerDate, type);
				
				//생성된 게시글을 배열에 저장
				board[cnt]=tmpBoard;
				cnt+=1;
				
				break;
			case 2:	
				System.out.print("수정할 게시글의 번호를 입력하세요.: ");
				num = sc.nextInt();
				if(num<=cnt && board[num-1] != null ) {
					
					System.out.println("게시글 정보를 입력하세요.");	
					
					System.out.print("제목: ");
					title=sc.next();
					System.out.print("내용: ");
					contents=sc.next();
					
					//나의 방법
					//board[num-1].setTitle(title);
					//board[num-1].setContents(contents);
					
					//다른 방법: 제목과 내용을 바꾸는 메소드 추가
					board[num-1].update(title, contents);
					
					
				}else {
					System.out.println("게시글이 없거나 삭제되었습니다.");
				}
				break;
			case 3:	
				//삭제할 게시글 번호 입력
				System.out.print("삭제할 게시글의 번호를 입력하세요.: ");
				num = sc.nextInt();
				//삭제 => 해당 정보를 null
				if(num<=cnt) {
					board[num-1]=null;
				}
				break;
			case 4:	
				//모든 게시글을 확인
				//번호 제목 작성자 작성일만 출력
				for(int i=0; i<cnt; i+=1) {
					if(board[i] != null) { //삭제한 게시글 출력 x
						board[i].summaryPrint();
					}
				}
				break;
			case 5:	
				//상세 내용을 확인할 게시글을 선택
				System.out.print("확인할 게시글의 번호를 입력하세요.: ");
				num = sc.nextInt();
				//게시글의 내용을 출력
				if(num<=cnt && board[num-1] != null) {
					//게시글을 확인하면 조회수를 1증가
					//방법1
					//views=board[num-1].getLike();
					//board[num-1].setLike(views+1);
					//board[num-1].print();
					//게시글 조회
					board[num-1].print();	
					 
				}else {
					System.out.println("해당 게시글이 없거나 삭제되었습니다.");
				}
				break;
			case 6:	System.out.println("종료");	break;
			default: 
				System.out.println("잘못된 메뉴입니다.");
			}
		}
		while(menu!=6); 	
			
		
		sc.close();
	}
	
	public static void printMenu() {
		System.out.println("------메뉴------");
		System.out.println("1.게시글 등록");
		System.out.println("2.게시글 수정");
		System.out.println("3.게시글 삭제");
		System.out.println("4.게시글 목록 확인");
		System.out.println("5.게시글 상세 확인");
		System.out.println("6.프로그램 종료");
		System.out.println("---------------");
		System.out.print("메뉴를 선택하세요: ");
		
	}
}
