package day4;

import java.util.Scanner;

public class Test4_4 {

	public static void main(String[] args) {
		/* Math.random()은 0보다 크거나 같고 1보다 작은 임의의 실수를 생성하는 기능
		 * Math.random() : A
		 * 0 <= A < 1
		 * 0*(max - min + 1) <=  A*(max - min + 1) <1*(max - min + 1)
		 * 0 <=  A*(max - min + 1) < max - min + 1
		 * min <= A*(max - min + 1) + min < max + 1
		 */
		int min = 1, max = 101;
		int r = (int)(Math.random() * (max - min + 1) + min);
		
		// 1 ~ 100 사이의 정수를 랜덤으로 생성하여 생성된 숫자를 맞추는 Up, Down 게임
		int num;
		
		Scanner scan = new Scanner(System.in);
		
		for(; ; ) {
			System.out.print("정수를 입력하세요(1~100) : ");
			num = scan.nextInt();
			
			if(r>num) {
				System.out.println("Up");
			} else if(r<num) {
				System.out.println("Down");
			} else {
				System.out.println("정답입니다.");
				break;
			}
		}
	}
}