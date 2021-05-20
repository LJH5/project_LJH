package day17;

import java.util.Scanner;

public class StringTest2 {
	//equals() 메소드 예제
	public static void main(String[] args) {
		//System.out.println("홍길동".equals("홍길동"));
		
		//두 단어를 입력받아 두 단어가 같은 단어인지 확인하는 코드를 작성하세요.
		Scanner sc = new Scanner(System.in);
		System.out.print("두 단어를 입력하세요(예: abc abc): ");
		String str1 = sc.next();
		String str2 = sc.next();
		//equals()사용시 null 체크를 하는 것이 좋은 습관
		if(str1 !=null && str1.equals(str2)) {
			System.out.println(str1+"은/는 "+str2+"와/과 같은 단어입니다.");
		}else {
			System.out.println(str1+"은/는 "+str2+"와/과 다른 단어입니다.");
		}
		
		sc.close();
	}

}
