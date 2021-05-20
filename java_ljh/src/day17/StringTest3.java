package day17;

import java.util.Scanner;

public class StringTest3 {

	public static void main(String[] args) {
		System.out.println("abcdef".indexOf("ab"));
		System.out.println("abcdef".indexOf("cd"));
		System.out.println("abcdef".indexOf("ad"));
		//두 단어 A, B를 입력받고 A에 B가 있는지 없는지 확인하는 코드를 작성하세요
		Scanner sc = new Scanner(System.in);
		System.out.print("두 단어를 입력하세요(예:Hello Hi): ");
		String A = sc.next();
		String B = sc.next();
		
		if(A != null && A.indexOf(B) != -1) {
			System.out.println("단어 "+ A + "에 "+ "단어 "+ B + "가 있음");
		}else {
			System.out.println("단어 "+ A + "에 "+ "단어 "+ B + "가 없음");
		}
		if(A != null) {
			System.out.println(A + "의 길이: " + A.length());
		}
		sc.close();
	}

}
