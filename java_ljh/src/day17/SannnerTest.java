package day17;

import java.util.Scanner;

public class SannnerTest {

	public static void main(String[] args) {
		// next(): 공백(엔터, 스페이스)을 만나기전까지 문자열을 가져오는 메소드
		// nextLine(): 처음 만나는 엔터전까지 문자열을 가져오는 메소드
		Scanner sc = new Scanner("1234 1234\n4567\n8910\n++++\n");
		
		while(sc.hasNext()) {
			String str = sc.nextLine();
			if(str.length() != 0) {
				System.out.println(str);
			}
		}
	
		//String str = sc.next();
		/*
		String str = sc.nextLine();		//1234 1234
		System.out.println(str);
		System.out.println("-----");	
		
		str = sc.nextLine();			//4567
		System.out.println(str);
		System.out.println("-----");	
		
		int num = sc.nextInt();			//8910
		System.out.println(num);
		System.out.println("-----");
		
		str = sc.nextLine();			//빈공백을 추출
		System.out.println(str);
		System.out.println("-----");
		*/
		sc.close();
	}

}
