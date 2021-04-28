package day3;

import java.util.Scanner;

public class For6 {

	public static void main(String[] args) {
		//정수의 약수를 출력하는 코드를 작성하세요.
		System.out.print("정수를 입력하세요. : ");
		Scanner scan = new Scanner(System.in);
		int num = scan.nextInt(); 
		scan.close();
		
		int i;
		for(i = 1; i <= num; i++) {
			if(num  % i == 0) {
				System.out.print(i + " ");
			}
		}
	
	}
}