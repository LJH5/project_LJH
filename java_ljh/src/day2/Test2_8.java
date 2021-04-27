package day2;

import java.util.Scanner;

public class Test2_8 {

	public static void main(String[] args) {
		// 두 정수와 산술 연산자를 입력받아 입력받은 연산자에 맞는 출력 코드를 작성하세요.
		
		System.out.print("두 정수와 연산자를 입력하세요.(예: 1 + 2) : ");
		Scanner scan = new Scanner(System.in);
		int num1 = scan.nextInt();
		char op = scan.next().charAt(0);
		int num2 = scan.nextInt();
		scan.close();
		
		double result = 0.0;
		
		if(op == '+') {
			result = num1 + num2;
		} else if(op == '-') {
			result = num1 - num2;
		} else if(op == '*') {
			result = num1 * num2;
		} else if(op == '/') {
			result = (double)num1 / num2;
		} else if(op == '%') {
			result = num1 % num2;
		}
		
		System.out.println("" + num1 + " "  + op + " "  + num2 + " = " + result + "입니다.");
		
	}
}
