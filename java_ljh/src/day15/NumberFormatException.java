package day15;

public class NumberFormatException {

	public static void main(String[] args) {
		String numStr="1234a";
		//parseInt(문자열): 문자열이 주어지면 정수를 반환하는 메소드
		int num = Integer.parseInt(numStr);
		System.out.println(num);

	}

}
