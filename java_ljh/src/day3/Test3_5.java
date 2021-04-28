package day3;

import java.util.Scanner;

public class Test3_5 {

	public static void main(String[] args) {
		// 월의 마지막 일수를 출력하는 예제를 switch문으로 작성하세요.
		// 31일 : 1 3 5 7 8 10 12
		// 30일 : 4 6 9 11
		// 28일 : 2
		
		Scanner scan = new Scanner(System.in);
		System.out.print("월을 입력하세요. : ");
		int month = scan.nextInt();
		scan.close();
		
		switch(month) {
		
		case 1, 3, 5, 7, 8, 10, 12:
			System.out.println(month + "월의 마지막 일수는 31일 입니다.");
		break;
		
		case 4, 6, 9, 11: 
			System.out.println(month + "월의 마지막 일수는 30일 입니다.");
		break;
		//case 4: case 6: case 9: case 11: 도 동일한 결과, 하지만 실행문은 'case 11:'의 실행문이며 나머지는 실행문이 없고 'break'가 없어서 'case 11:'까지 실행된 결과임
		
		case 2:
			System.out.println(month + "월의 마지막 일수는 28일 입니다.");
		break;
		
		default:
			System.out.println(month + "월은 없습니다.");
		}
		

	}

}
