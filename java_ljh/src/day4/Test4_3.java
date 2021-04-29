package day4;

import java.util.Scanner;

public class Test4_3 {

	public static void main(String[] args) {
		// 정수를 거꾸로 출력하는 코드를 작성하세요.
		
		System.out.print("정수를 입력하세요. : ");
		Scanner scan = new Scanner(System.in);
		int num;
		int n;
		
		num = scan.nextInt();
		
		for(; ; ) {
			System.out.print(num%10);
			num /= 10;
			if(num == 0) {
				break;
			}
		}	
		System.out.println();
		
		
		 //if-break 사용 안하기
		System.out.print("정수를 입력하세요. : ");
		n = scan.nextInt();
		for(; n>0; n /= 10) {
			System.out.print(n%10);
		}
		
		
		scan.close();
		
		
	}
}