package day2;

import java.util.Scanner;

public class Test2_6 {

	public static void main(String[] args) {
		/* 성적을 입력받아 입력받은 성적을 출력하는 코드를 입력하세요.
		 * A: 90이상 100이하
		 * B: 80이상 90미만
		 * C: 70이상 80미만
		 * D: 60이상 70미만
		 * F: 0이상 60미만
		 * 잘못된 성적: 0미만, 100초과
		 */
		
		System.out.print("성적을 입력하세요. : ");

		Scanner scan = new Scanner(System.in);
		int grade = scan.nextInt();
		
		if(grade > 100) {
			System.out.println("잘못된 성적");
		} else if(grade >= 90) {
			System.out.println("A");
		} else if(grade >= 80) {
			System.out.println("B");
		} else if(grade >= 70) {
			System.out.println("C");
		} else if(grade >= 60) {
			System.out.println("D");
		} else if(grade >= 0) {
			System.out.println("F");
		} else {
			System.out.println("잘못된 성적");
		}
	}
}
