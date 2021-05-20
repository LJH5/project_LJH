package day16;

public class ThrowTest {

	public static void main(String[] args) {
		// 자바에서 정해놓은 예외가 아닌 개발자가 발생시키는 예외를 만들 때 사용
		try {
			int num = 1;
			if(num == 1) {
				RuntimeException e = new RuntimeException("예외");
				throw e;
				//throw new RuntimeException("예외");
			}
		}catch(RuntimeException e) {
			System.out.println("실행 예외가 발생");
		}catch(Exception e) {
			System.out.println("예외가 발생");
		}
		
		//실행 예외는 예외처리를 안해도 프로그램은 실행된다.
		throw new RuntimeException("예외");
		
		//실행 예외가 아닌 예외는 무조건 예외처리를 해야한다. try{} 사용/ 안하면 에러 발생
		throw new Exception("예외");
	}

}
