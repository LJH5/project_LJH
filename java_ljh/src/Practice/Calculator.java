package Practice;

public class Calculator {

	/* 기능	 : 전원 켜기
	 * 매개변수: 없음
	 * 리턴타입: void
	 * 메소드명: powerOn
	 */
	void powerOn() {
		System.out.println("전원을 켭니다");
	}
	
	/* 기능	 : 더하기 계산
	 * 매개변수: int x, int y
	 * 리턴타입: int
	 * 메소드명: plus
	 */
	public int plus(int x, int y) {
		int res = x + y;
		return res;
	}
	
	/* 기능	 : 나누기 계산
	 * 매개변수: int x, int y
	 * 리턴타입: double
	 * 메소드명: divide
	 */
	public double divide(int x, int y) {
		double res=(double)x/y;
		return res;
	}
	
	/* 기능	 : 전원끄기
	 * 매개변수: 없음
	 * 리턴타입: void
	 * 메소드명: powerOff
	 */
	void powerOff() {
		System.out.println("전원을 끕니다");
	}
}
