package day2;

import java.util.Scanner;

public class Test2_5 {

	public static void main(String[] args) {
		/*
		 *  정수를 입력받아 6의 배수이면 6의 배수라고 출력하고,
		 *  2의 배수이면 2의 배수라고 출력하고,
		 *  3의 배수이면 3의 배수라고 출력하고,
		 *  2, 3, 6의 배수가 아니면 2, 3, 6의 배수가 아닙니다라고 출력하는 코드를 작성하세요. 
		 *  단, 동시에 6의 배수인 동시에 2 또는 3의 배수인 경우 6의 배수입니다라고 하나만 출력함
		 */
		
		System.out.print("정수를 입력하세요. : ");
		Scanner scan = new Scanner(System.in);
		int num = scan.nextInt();
		
		if(num % 6 == 0) {
			System.out.println("6의 배수입니다.");
		} else if(num % 2 == 0) {
			System.out.println("2의 배수입니다.");
		} else if(num % 3 == 0) {
			System.out.println("3의 배수입니다.");
		} else {
			System.out.println("2, 3, 6의 배수가 아닙니다.");
		}

	}
}
