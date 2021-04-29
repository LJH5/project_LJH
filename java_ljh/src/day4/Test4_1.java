package day4;

public class Test4_1 {

	public static void main(String[] args) {
		// 11부터 20까지 출력하는 코드를 작성하세요. 반복횟수, 규칙성, 반복문 종료후
		int i;
		
		for(i = 11; i <= 20; i += 1) {
			System.out.print(i + " ");
		}
		System.out.println();
		
		
		// 20부터 11까지 출력하는 코드를 작성하세요
		for(i = 20; i >= 11; i -= 1) {
			System.out.print(i + " ");
		}
		System.out.println();
		
		
		// 1부터 100까지 1의 자리가 3, 6, 9로 끝나는 수들을 출력하는 코드를 입력하세요. 3개씩 끊어서 출력, if 사용
		for(i = 1; i <= 100; i += 1) {
			if(i % 10 == 3 || i % 10 == 6 || i % 10 == 9) {
				System.out.print(i + " ");
			}
			if( i % 10 == 9) {
				System.out.println();	
			}
		}
		System.out.println();
		
		
		// 1부터 100까지 1의 자리가 3, 6, 9로 끝나는 수들을 출력하는 코드를 입력하세요. 3개씩 끊어서 출력, if-else if 사용
		for(i = 1; i <= 100; i += 1) {
			if(i % 10 == 3) {
				System.out.print(i + " ");
			} else if(i % 10 == 6) {
				System.out.print(i + " ");
			} else if(i % 10 == 9) {
				System.out.println(i + " ");
			}	
		}
		System.out.println();
		
		// 1부터 100까지 1의 자리가 3, 6, 9로 끝나는 수들을 출력하는 코드를 입력하세요. 3개씩 끊어서 출력, switch 사용
		for(i = 1; i <= 100; i += 1) {
			switch(i % 10) {
			
			case 3:
				System.out.print(i + " ");
				break;	
			case 6:
				System.out.print(i + " ");
				break;
			
			case 9:
				System.out.println(i + " ");
				break;
			
			default:
			}	
		}
		System.out.println();
		
		
		// 1부터 100까지 1의 자리가 3, 6, 9로 끝나는 수들을 출력하는 코드를 입력하세요. 3개씩 끊어서 출력, 강사님 방법
		int k;
		for(i = 1, k =0; i <= 100; i += 1) {
			if(i % 10 == 3 || i % 10 == 6 || i % 10 == 9) {
				System.out.print(i + " ");
				k += 1;
				if(k % 3 == 0) {
					System.out.println();
				}
			}
		}
		System.out.println();
		
		
	}
}
	 