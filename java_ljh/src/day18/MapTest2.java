package day18;

import java.util.HashMap;
import java.util.Scanner;

public class MapTest2 {

	public static void main(String[] args) {
		/*	1. 회원가입
		 *  2. 로그인
		 *  3. 종료
		 *  
		 *  메뉴선택: 1
		 *  
		 */	
		int menu;
		String id, pw;
		
		Scanner sc = new Scanner(System.in);
	
		do {
			System.out.println("1. 회원가입");
			System.out.println("2. 로그인");
			System.out.println("3. 종료");
			System.out.print("메뉴 선택: ");
			menu = sc.nextInt();
			
			if(menu==1) {	
				HashMap<String, String> map = new HashMap<String, String>();
				System.out.print("아이디: ");
				id=sc.next();
				
				if(!map.containsKey(id)) {
					System.out.print("비밀번호: ");
					pw=sc.next();
					map.put(id, pw);
					System.out.println("회원가입성공");
					
				}else {
					System.out.println("이미 가입된 회원입니다");
				}
				break;
				
			
			}
			
		}while(menu !=3);
		sc.close();
	}

}
