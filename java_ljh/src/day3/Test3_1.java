package day3;

public class Test3_1 {

	public static void main(String[] args) {
		
		int num1 = 1, num2 = 0;
		
		// 정수를 0으로 나누면 예외 발생
		int res = num1/num2;     
		System.out.println(res);
		
		// 실수를 0으로 나누면 예외 발생 안함, Infinity
		System.out.println(1.0/0);
	
	}
	
}