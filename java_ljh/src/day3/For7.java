package day3;

import java.util.Scanner;

public class For7 {

	public static void main(String[] args) {
		// 두 정수의 최대 공약수를 구하는 코드를 작성하세요.
		System.out.print("두 정수를 입력하세요. : ");
		Scanner scan = new Scanner(System.in);
		int num1 = scan.nextInt(); 
		int num2 = scan.nextInt();
		scan.close();
		
		/* 유클리드 호제법
		 * int i;
		
		if(num1 >= num2) {
			for(; num2 > 0; num2 = i % num2) {
				i = num1;
				num1 = num2;
				
			}
		System.out.println("최대 공약수 : " + num1);	
		} else {
			for(; num1 > 0; num1 = i % num1) {
				i = num2;
				num2 = num1;
				
			}
		System.out.println("최대 공약수 : " + num2);	
		}
		*/
		
		/* 내가한 방법
		int i, j, gcd;
		gcd = 1;
		
		for(i = 1; i <= num1; i++) {    				
			if(num1 % i ==0) {
				for(j = 1; j <= num2; j++) {			
					if(num2 % j ==0 && i == j) {
						gcd = j;	
					}
				}		
			}
		}
		System.out.println(num1 + "과" + num2 + "의 최대 공약수는 : " + gcd);
		*/
		
		// 강사님 방법
		int i, gcd;
		gcd = 1;
		
		for(i = 1; i <= num1; i++) {
			if(num1 % i == 0 && num2 % i == 0) {
				gcd = i;
			}
		}
		System.out.println(num1 + ", " + num2 + "의 최대 공약수는 : " + gcd);
	}
}
	
