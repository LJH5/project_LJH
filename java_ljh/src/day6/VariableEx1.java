package day6;

public class VariableEx1 {
	static int num=10; //VariableEx1 클래스의 멤버변수 'num'
	public static void main(String[] args) {
		/* 지역변수: 우리가 지금까지 사용한 일반 변수, 선언된 위치부터 해당 {}안 끝까지 사용가능
		 * 멤버변수: 클래스안에 있는 변수로 해당 클래스의 모든 곳에서 사용가능
		 * 
		 */
		
		int i; //11~21 줄까지 사용가능, 메인 메소드 안에서 선언 => 메인 메소드 끝까지 사용 가능
		for(i=1; i<=5; i += 1) {
			System.out.print("*");
		}
		System.out.println(i);
		
		for(int k = 1; k<=5; k+=1) { //17~18 줄까지 사용가능, k는 반복문 안에서 선언했기 때문에 반복문 안에서만 사용 가능
			System.out.print("*");
		}
		System.out.println();
		System.out.println(num);
	}
	public static void test() {
		//i = 10; // 에러발생: test 메소드에서는 'i'라는 변수가 선언되지 않았기 떄문에 
		System.out.println(num);
	}
}
