package day7;

public class MethodEx5 {

	public static void main(String[] args) {
		// *****을 출력하도록 메소드를 생성하여 테스트해보세요. -> 주어진 문자를 주어진 횟수만큼 출력(재사용성 높이기)
		printChar1('*',5);
		printChar1('*',9);
		printChar1('-',5);
		
		System.out.println(printChar2('*',7) + printChar2('-',2));
	}
	
	/* 기능	 :  주어진 문자를 주어진 횟수만큼 출력
	 * 매개변수: char ch, int cnt
	 * 리턴타입: void
	 * 메소드명: printChar
	 */
	public static void printChar1(char ch, int cnt) {
		for(int i=0; i<cnt; i+=1) {
			System.out.print(ch);
		}
		System.out.println();
	}

	/* 기능	 :  주어진 문자를 주어진 횟수만큼 반복하여 하나의 문자열로 알려주는 메소드
	 * 매개변수: char ch, int cnt
	 * 리턴타입: void
	 * 메소드명: printChar
	 */
	public static String printChar2(char ch, int cnt) {
		String str = "";
		for(int i=0; i<cnt; i+=1) {
			str+=ch;
		}
		return str;
	}
}
