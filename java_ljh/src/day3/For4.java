package day3;

public class For4 {

	public static void main(String[] args) {
		// 1부터 10까지의 짝수들만 출력하는 코드를 작성하세요.
		
		int i;
		//방법1
		for(i=2; i<=10; i+=2) {
			System.out.print(i + " ");
		}
		System.out.println();
		
		//방법2
		for(i=1; i<=10; i++) {
			if(i % 2 == 0) {
				System.out.print(i + " ");
			}	
		}
		System.out.println();
		
		//방법3
		for(i=1; i<=5; i++) {
			System.out.print(i * 2 + " ");
		}
		System.out.println();
		
		/* i x 2 지만 조잡함
		for(int i = 1 ; i <= 5 ; i++) {
			for(int j = i ; j <= i; j++) {
				System.out.println(i+j);
			}
		} */
	}

}
