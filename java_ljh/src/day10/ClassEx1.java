package day10;

public class ClassEx1 {

	public static void main(String[] args) {
		A a = new A();
		a.num=10;
		
		B b = new B();	//protected: 클래스 B와 ClassEx1은 같은 패키지에 있어서 에러 발생 안함
		b.num=10;
		
		C c = new C();	//default: 클래스 B와 ClassEx1은 같은 패키지에 있어서 에러 발생 안함
		c.num=10;
		
		D d = new D();
		//d.num=10;		//private: 본인 클래스의 메소드에서만 사용이 가능함
		d.setNum(10);
		System.out.println(d.getNum());
	}

}
