package day11;

public class BoardTest {

	public static void main(String[] args) {
		Board board = new Board(1, "제목입니다", "내용입니다", "이준호", "2021-05-11", "공지");
		board.print();
		
		//"="은 오른쪽에 있는 값을 왼쪽에 저장하는데, 타입이 같거나 변환이 가능해야한다. double a=1; 정수->실수 자동타입변환, int b = (int)1.0; 실수->정수 강제타입변환
	}
	
}
