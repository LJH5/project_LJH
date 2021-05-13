package day13;

import Board.Board;

public class VariableTest {

	public static void main(String[] args) {
		int num5=0;				//지역변수 -> 일반변수, 지역변수
		String str3 = "Hello";  //지역변수 -> 참조변수, 지역변수, 객체
		int []arr;				//지역변수 -> 참조변수, 지역변수, 배열
		
		Board[] board = new Board[5]; //참조변수, 지역변수, 배열
	}

}
class A{
	int num1;			//멤버변수 -> 일반변수, 객체멤버변수
	static int num2;	//멤버변수 -> 일반변수, 클래스멤버변수
	String str1;		//멤버변수 -> 참조변수, 객체멤버변수, 객체
	static String str2;	//멤버변수 -> 참조변수, 클래스멤버변수, 객체
	public A(int num3, int num4) {	//생성자 -> 일반변수, 매개변수
		num1=num3;
		num2=num4;
	}
}