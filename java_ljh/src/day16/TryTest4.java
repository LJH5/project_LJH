package day16;

import java.util.Scanner;

public class TryTest4 {

	public static void main(String[] args) {
		
		//두 정수와 산술연산자를 입력받아 산술연산 결과를 출력하는 코드를 작성하세요.
		/* 나의 방법: 0나누기는 예외처리 했지만 입력을 잘못 받았을 때는 예외처리하지 않음
		double res=0.0;
		
		System.out.print("두 정수와 산술 연산자를 입력하세요(예: 1 + 2): ");
		Scanner sc = new Scanner(System.in);
		int num1 = sc.nextInt();
		char op = sc.next().charAt(0);
		int num2 = sc.nextInt();
		
		switch(op) {
		case '+':	
			res = num1+num2;
			break;
		case '-': 
			res = num1-num2;
			break;
		case '*':
			res = num1*num2;
			break;
		case '/':
			try {
				res = (double)num1/num2;
			}catch(ArithmeticException e) {
				System.out.println("예외 발생: 0으로 나누기");
				return;
			}
			break;
		case '%':
			try {
				res = num1%num2;
			}catch(ArithmeticException e){
				System.out.println("예외 발생: 0으로 나누기");
				return;
			}
			break;
		default:
			System.out.println("잘못된 연산자입니다.");
		}
		System.out.println(num1 + " " + op + " " + num2 + " = " + res);
		sc.close();
		*/
			
		double res=0.0;
		
		System.out.print("두 정수와 산술 연산자를 입력하세요(예: 1 + 2): ");
		Scanner sc = new Scanner(System.in);
		try {
			int num1 = sc.nextInt();
			char op = sc.next().charAt(0);
			int num2 = sc.nextInt();
			
			switch(op) {
			case '+':	
				res = num1+num2;
				break;
			case '-': 
				res = num1-num2;
				break;
			case '*':
				res = num1*num2;
				break;
			case '/':
				res = (double)num1/num2;	
				break;
			case '%':
				res = num1%num2;
				break;
			default:
				throw new Exception("잘못된 연산자입니다.");
			}
			System.out.println(num1 + " " + op + " " + num2 + " = " + res);
		}catch(ArithmeticException e) {
			System.out.println("0으로 나눌수 없습니다.");
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		System.out.println("프로그램 종료합니다.");
		sc.close();
		
	}

}
