package day2;

import java.util.Scanner;

public class LogicalOpreator {

	public static void main(String[] args) {
		// 논리 연산자 예제
		
		// !연산자
		System.out.println("4는 짝수인가? " + (4 % 2 == 0));
		System.out.println("4는 홀수가 아닌가? " + !(4 % 2 == 1));
		System.out.println();
		
		// &&연산자, 변수 num가 2의 배수이고 3의 배수이면 6의 배수이다.
		Scanner scan = new Scanner(System.in);
		System.out.print("정수를 입력하세요. : ");
		int num = scan.nextInt();
		System.out.println(num + "은/는 6의 배수인가? : " + (num % 2 == 0 && num % 3 == 0));
		System.out.println();
		
		/* ||연산자, 청소년의 14세부터 19세까지이다. 청소년이 아닌 사람은 13세 미만이거나 19세 초과인 경우이다.
		 * 나이가 age인 학생은 청소년이 아닌지 확인하는 예제
		 */	
		System.out.print("나이를 입력하세요. : ");
		int age = scan.nextInt();
		System.out.println(age + "살은 청소년이 아닌가? " + (age < 14 || age > 19));
		System.out.println();
		scan.close();
	
		// ^연산자
		System.out.println("true  ^  true : " + (true  ^  true));
		System.out.println("true  ^ false : " + (true  ^ false));
		System.out.println("false ^  true : " + (false ^  true));
		System.out.println("false ^ false : " + (false ^ false));
		System.out.println();
	
	}
}


