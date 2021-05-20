package day16;

public class ExceptionTest {
	public static void main(String[] args) {
		try {
			throw new Exception("예외");
		}
		//예외가 발생하면 Exception 클래스를 이용하여 객체 e를 선언하고 발생한 예외를 객체 e에 저장 
		catch(Exception e) {
			//getMessage(): 생성자에 넣어준 문자열을 가져옴
			System.out.println(e.getMessage());
			//printStackTrace(): 예외가 발생한 위치를 출력하는 메소드
			e.printStackTrace();
		}
		System.out.println("종료");
	}
}
