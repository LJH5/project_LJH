package day17;

import java.util.Scanner;

public class StringTest9 {

	public static void main(String[] args) {
		// 공백을 포함한 긴 문자열을 입력한 후 단어를 입력받아 해당 단어가 몇번 나오는지 확인하는 코드를 작성하세요.
		Scanner sc = new Scanner(System.in);
		
		System.out.print("문장 입력: ");
		String str1 = sc.nextLine();
	
		System.out.print("단어 입력: ");
		String str2 = sc.next();
		
		int cnt=0;
		int index=0;
		
		while(true) {
			index = str1.indexOf(str2);
			if(index == -1) {
				break;
			}
			cnt++;
			str1=str1.substring(index+1);
		}
		System.out.println(cnt+"번");
		sc.close();
	}
}
