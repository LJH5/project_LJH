package day1;

public class Println {

	public static void main(String[] args) {
		/*System.out.println() :  ()내용을 콘솔에 출력하는 메소드(기능), 내용을 출력후 엔터를 침(줄 바꿈)
		 * System.out.println(문자열)
		 * System.out.println(정수)
		 * System.out.println(실수)
		 * System.out.println(논리형)
		 * System.out.println(문자)
		 */
		System.out.println("Hello");
		System.out.println(1);
		System.out.println(3.14);
		System.out.println(true);
		System.out.println('A');
		
		System.out.println(1+2+3);
		System.out.println("1"+2+3);	//문자열1 + 정수2 => 문자열12, 문자열12 + 정수3 => 문자열123
		System.out.println("1"+(2+3)); 	//문자열 1 + 정수5 => 문자열15
		System.out.println(1+2+"3"); 	//정수3 + 문자열3 => 문자열33

	}

}