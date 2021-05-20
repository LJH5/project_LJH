package day16;

public class ThrowsTest {
	public static void main(String[] args) {
		try {
			test();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
	//throws: 메소드에서 예외 발생시 직접 예외를 처리하지 않고 호출한 메소드에세 예외처리를 떠넘길 수 있다
	//','를 이용하여 여러가지 예외처리 가능
	public static void test() throws Exception, ArithmeticException{ 
		throw new Exception("test 메소드에서 예외 발생");
	}
	
	/*RuntimeException인 경우 throws Exception 생략 가능
	public static void test() { 
		throw new RuntimeException("test 메소드에서 예외 발생");
	}*/
}
