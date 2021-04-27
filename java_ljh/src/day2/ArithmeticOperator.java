package day2;

public class ArithmeticOperator {

	public static void main(String[] args) {
		// 산술연산자 '/' 예제
		System.out.println("1  /2 = " + 1/2);
		System.out.println("1.0/2 = " + 1.0/2);
		System.out.println("1  /2.0 = " + 1/2.0);
		System.out.println("1.0/2.0 = " + 1.0/2.0);
		System.out.println();
		
		int num1, num2;
		num1= 1;
		num2= 2;
		//num1을 일시적으로 실수로 변환하여 계산함
		System.out.println((double)num1 / num2);
		System.out.println();
		
		System.out.println("7 % 4 = " + 7%4);
		System.out.println();
		
		char ch = 'A';
		ch = (char)(ch+1); // char + int => int, 강제 타입 변환 : 정수=>문자
		System.out.println(ch);
	}

}
