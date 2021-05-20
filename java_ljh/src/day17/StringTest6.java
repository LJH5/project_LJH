package day17;

import java.util.Scanner;

public class StringTest6 {
	public static void main(String[] args) {
		/*
		String str = "1234-567-1564";
		String []hobLis = str.split("-");
		System.out.println(hobLis[0]);
		System.out.println(hobLis[1]);
		System.out.println(hobLis[2]);
		*/
		
		//취미를 한 줄로 입력받아 각 취미를 출력하는 코드를 작성하세요.
		Scanner sc = new Scanner(System.in);
		System.out.print("취미를 입력하세요(예: 영화보기,음악감상,독서): ");
		String hob = sc.next();
		String []hobList = hob.split(",");
		
		for(int i=0; i<hobList.length; i++) {
			System.out.println((i+1)+". "+hobList[i]);
		}
		sc.close();
	}
	
}
