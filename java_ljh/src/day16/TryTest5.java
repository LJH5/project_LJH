package day16;

import java.util.InputMismatchException;
import java.util.Scanner;

public class TryTest5 {

	public static void main(String[] args) {
		System.out.print("두 정수와 산술 연산자를 입력하세요(예: 1 + 2): ");
		Scanner sc = new Scanner(System.in);
		try {
			int num1 = sc.nextInt();
			char op = sc.next().charAt(0);
			int num2 = sc.nextInt();
			double res =0.0;
			
			res = calculate(num1, op, num2);
			
			System.out.println(num1 + " " + op + " " + num2 + " = " + res);
		}catch(InputMismatchException e) { //Scanner 사용시 발생할 수 있는 예제
			System.out.println("잘못된 값을 입력하였습니다.");
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		System.out.println("프로그램 종료합니다.");
		sc.close();
		
	}
	/* 기능	 : 두 정수와 산술연산자를 입력받아 산술연산 결과를 출력하는 코드
	 * 매개변수: int num1, char op, int num2 
	 * 리턴타입: double
	 * 메소드명: calculate
	 */
	public static double calculate(int num1, char op, int num2){
		double res=0.0;
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
			//num2가 0이어도 실수/정수이어서 예외가 자동적으로 발생하지 않음, 예외를 발생시키기 위해 if문과 throw사용
			if(num2==0) {
				throw new ArithmeticException("0으로 나눌수 없습니다.");
			}
			res = (double)num1/num2;	
			break;
		case '%':
			if(num2==0) {
				throw new ArithmeticException("0으로 나눌수 없습니다.");
			}
			res = num1%num2;
			break;
		default:
			//잘못된 연산자가 들어오면 예외를 발생
			throw new RuntimeException("잘못된 연산자입니다.");
		}
		return res;
	}
}
