package day15;

public class AbstractTest {

	public static void main(String[] args) {
		//클래스 A에 객체 a를 생성
		A a = new A();
		
		//추상클래스 B의 객체 b를 생성
		B b = new B(); //오류발생
		
		//추상클래스 B를 상속받은 클래스 C의 객체 c를 생성
		C c = new C();
		
		//클래스 C를 이용하여 객체를 생성한 후 추상클래스 B의 객체에 저장
		B b1 = new C();
	}

}

class A{}
abstract class B{
	abstract void print();
}
class C extends B{

	@Override //추상클래스에 추상메소드가 있으면 자식클래스가 일반클래스인 경우 추상 메소드를 무조건 오버라이딩해야 한다.
	void print() {
		// TODO Auto-generated method stub
		
	}
} 
class D{}