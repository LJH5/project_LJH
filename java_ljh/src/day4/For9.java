package day4;

public class For9 {

	public static void main(String[] args) {
		// 무한루프 : 반복문이 끝나지 않는 경우를 무한루프라 한다.
		int i = 1;
		for( ; i < 5 ; ) {
			System.out.println("Hello would!");
		}
		
		// 한 번도 실행되지 않음
		for( ; i > 5 ; ) {
			System.out.println("Hello would!");
		} 		
	}
}
