package day19;

public class StaticTest {

	public static void main(String[] args) {
		// 객체 메소드는 클래스 메소드에서 바로 사용할 수 없다.
		print();
		StaticTest st = new StaticTest();
		st.print();

	}
	
	public void print() {
		System.out.println("안녕하세요.");
	}

}
