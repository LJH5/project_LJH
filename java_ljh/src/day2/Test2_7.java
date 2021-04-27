package day2;

import java.util.Scanner;

public class Test2_7 {

	public static void main(String[] args) {
		// 평년의 월의 마지막 일수를 출력하는 코드를 작성하세요.
		// 31일: 1, 3, 5, 7, 8, 10, 12월
		// 30일: 4, 6, 9, 11월
		// 28일: 2월
		
		System.out.print("월을 입력하세요. : ");
		Scanner scan = new Scanner(System.in);
		int month = scan.nextInt();
		
		scan.close();
		
		if(month == 4 || month == 6 || month == 9 || month == 11) {
			System.out.println(month + "월은 30일 까지 있습니다.");
		} else if (month == 2) {
			System.out.println(month + "월은 28일 까지 있습니다.");
		} else {
			System.out.println(month + "월은 31일 까지 있습니다.");
		}
				
	}

}
