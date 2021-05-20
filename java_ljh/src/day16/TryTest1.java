package day16;

public class TryTest1 {

	public static void main(String[] args) {
		int num1 = 1, num2 = 0;
		//예외 발생 시 catch에서 해당 클래스나 조상 클래스가 있으면 예외를 처리한다.
		//ArithmeticException > RuntimeException > Exception
		try {
			System.out.println(num1/num2);
		}
		//Exception e: 모든 예외 처리, ArithmeticException의 조상이므로 처리 가능
		catch(Exception e) { 
			System.out.println("예외 발생: 0으로 나눌 수 없습니다.");
		}
		System.out.println("예외 처리 1번 종료");
		
		try {
			System.out.println(num1/num2);
		}
		//ArithmeticException e: 나누기할 때 발생하는 예외 처리
		catch(ArithmeticException e) { 
			System.out.println("예외 발생: 0으로 나눌 수 없습니다.");
		}
		System.out.println("예외 처리 2번 종료");
		
		try {
			System.out.println(num1/num2);
		}
		//RuntimeException e: ArithmeticException의 부모이므로 처리 가능
		catch(RuntimeException e) { 
			System.out.println("예외 발생: 0으로 나눌 수 없습니다.");
		}
		System.out.println("예외 처리 3번 종료");
		
		try {
			System.out.println(num1/num2);
		}
		//ClassCastException e: ArithmeticException의 조상이 아니므로 불가능
		catch(ClassCastException e) { 
			System.out.println("예외 발생: 0으로 나눌 수 없습니다.");
		}
		System.out.println("예외 처리 4번 종료");
		
		System.out.println("프로그램 종료");
	}

}
