package day17;

public class StringTest5 {

	public static void main(String[] args) {
		System.out.println("Hello".toUpperCase()); //전부 대문자로
		System.out.println("Hello".toLowerCase()); //전부 소문자로
		
		//trim(): 공백 제거
		String str = "\n\n\n	안녕하세요		\n\n\n";
		System.out.println("trim()전 str");
		System.out.println(str);
		System.out.println("trim()후 str");
		System.out.println(str.trim());
		
		//valueOf(기본타입): 기본타입값을 문자열로 변경해주는 클래스 메소드
		String num1 = ""+1;
		System.out.println(num1);
		String num2 = String.valueOf(1);
		System.out.println(num2);
	}

}
