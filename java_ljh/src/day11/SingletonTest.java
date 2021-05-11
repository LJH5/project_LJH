package day11;

public class SingletonTest {

	public static void main(String[] args) {
		// 싱글톤: 전체 프로그램에서 하나의 클래스로 단 하나의 객체만 있어야 하는 경우에 만든 단 하나의 객체
		// 싱글톤을 만드려면 1. 생성자의 접근제한자를 private으로 해서 외부에서 생성자를 호출할 수 없게 한다.
		// 2. 클래스의 멤버변수로 해당 클래스의 클래스 변수를 만듦
		// 3. 클래스 변수를 가져오는 메소드를 선언 및 구현 (getter)
		
		//Singleton singleton = new Singleton();   에러 발생: private
		
		// 이미 만들어진 Sigleton 객체를 가져올 뿐이다
		Singleton s1 = Singleton.getSingleton();
		Singleton s2 = Singleton.getSingleton();
		if(s1 == s2) {
			System.out.println("같은 객체입니다");
		}
	}
}

class Singleton{
	// 2. 클래스의 멤버변수로 해당 클래스의 클래스 변수를 만듦
	private static Singleton singleton = new Singleton();
	
	//1. 생성자의 접근제한자를 private
	private Singleton() {}

	public static Singleton getSingleton() {
		return singleton;
	
	}
}