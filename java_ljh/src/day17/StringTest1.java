package day17;

import java.util.Scanner;

public class StringTest1 {
	//charAt() 메소드 예제
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("문자를 입력");
	
		//char op = sc.next().charAt(0);
		//Scanner에서 제공하는 next()라는 메소드를 통해 콩솔에서 입력받은 문자열을 가져옴
		String str = sc.next();
		//String 클래서에서 제공하는 charAt()라는 메소드를 통해 0번지에 있는 문자를 가져온다
		char op = str.charAt(0);
		System.out.println("입력 문자: "+op);

	}

}
