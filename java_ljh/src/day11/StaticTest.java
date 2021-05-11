package day11;

public class StaticTest {

	public static void main(String[] args) {
		// 객체 생성없이 객체를 호출할 수 있다
		TestB t1 = new TestB();
		t1.num1 = 10;
		//t1.num2=30; 가능하지만 잘 안씀
		TestB.num2=20;
		TestB t2 = new TestB();
		
		t1.num1 = 10;
		t1.num2 = 30;
		
		TestB.num2=20;
		t2.printNum1();
		TestB.printNum2();
	}

}

class TestB{
	//객체 멤버 변수 정수 num1을 선언
	public int num1;
	
	//정적 멤버 변수 정수 num2을 선언
	public static int num2;
	
	public void printNum1() {
		//객체 멤버 변수는 객체 메소드에서 사용 가능
		System.out.println("num1: "+ num1);
		
		//클래스 멤버 변수/메소드는 객체 메소드에서 사용 가능
		num2 = 20;
	}
	
	public static void printNum2() {
		//클래스 멤버 변수는 클래스 메소드에서 사용 가능
		System.out.println("num2: "+ num2);
		
		//객체 멤버 변수/메소드는 클래스 메소드에서 사용 불가능
		//num1=10;  에러 발생
	}
	
}