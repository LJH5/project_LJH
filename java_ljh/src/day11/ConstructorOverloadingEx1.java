package day11;

public class ConstructorOverloadingEx1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		A a1 = new A();
		A a2 = new A(1,2);
		A a3 = new A(1.0,2); //실수->정수, 자동 형변환이 안됨
		A a4 = new A('a',2);//문자->정수, 자동 형변환 됨
	}

}
class A{
	private int num1;
	private int num2;
	public void A() {} // 생성자와 이름이 같은 메소드
	public A() {}
	public A(int num3, int num4) {
		num1=num3;
		num2=num4;
	}
	//복사 생성자: 생성자의 매개변수로 같은 클래스의 객체가 오는 경우
	public A(A a) {
		num1 = a.num1;
		num2 = a.num2;
	}
	
	
	
	public int getNum1() {
		return num1;
	}
	public void setNum1(int num1) {
		this.num1 = num1;
	}
	public int getNum2() {
		return num2;
	}
	public void setNum2(int num2) {
		this.num2 = num2;
	}
	public A(double num10, double numll) {}
	
	
}