package day17;

import java.util.Scanner;

public class StringTest {

	public static void main(String[] args) {
		//replace("A","B"): A문자열을 B문자열로 교체하고 알려줌, 원본은 바뀌지 않는다
		System.out.println("제 이름은 홍길동입니다.".replace("홍길동", "임꺽정"));
		
		//문자열 C를 입력받고, 해당 단어에 교체할 문자열 A와 문자열 B를 입력받아
		//문자열 C에 있는 문자열 A를 문자열 B로 바꾸는 코드를 작성하세요.
		Scanner sc = new Scanner(System.in);
		System.out.print("문자열을 입력하세요(예: 자바프로그래밍): ");
		String strC = sc.next();
		
		System.out.print("교체하고 싶은 단어와 교체할 단어를 입력하세요(예: 자바 JAVA): ");
		String strA = sc.next();
		String strB = sc.next();
		
		if(strC != null && strC.indexOf(strA) != -1) {
			strC = strC.replace(strA, strB);
			System.out.println(strC);
		}else {
			System.out.println("단어를 바꿀 수 없습니다.");
		}
		sc.close();
	}

}
