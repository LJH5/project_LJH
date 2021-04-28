package day3;

import java.util.Scanner;

public class Test3_2 {

	public static void main(String[] args) {
		// 정수를 입력받아 입력받은 정수가 0, 양수, 음수인지 판별하는 코드를 작성하세여
		
		System.out.print("정수를 입력하세요. : ");
		
		Scanner scan = new Scanner(System.in);
		int num = scan.nextInt();
		
		scan.close();
		
		String result;
		
		if(num == 0) {
			result = "0";
		} else if(num > 0) {
			result = "양수";
		} else {
			result = "음수";
		}
			System.out.println("입력받은 값은 " + result + "입니다.");
		
	}

}
