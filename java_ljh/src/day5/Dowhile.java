package day5;

import java.util.Scanner;

public class Dowhile {

	public static void main(String[] args) {
		// 입력받은 문자가 q또는 Q이면 종료하는 예제
		
		char ch;
		
		Scanner sc = new Scanner(System.in);
		
		do {
			System.out.print("입력(종료하려면 q/Q입력) : ");
			ch = sc.next().charAt(0);
		}while(ch != 'q' && ch != 'Q');

			
			 sc.close();

	}

}
