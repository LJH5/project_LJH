package day4;

public class For8 {

	public static void main(String[] args) {
		// a부터 z까지 출력하는 코드를 작성하세요.
		char ch;
		int i;	
		for(i = 0 ; i < 26; i += 1) {
			ch = 'a'; // ch = 'a' + i 일때는 왜 실행이 안될까?
			ch += i;
			System.out.print(ch + " ");	
		}
		System.out.println();
	
		
		//  a부터 z까지 출력하는 코드를 작성하세요. 강사님 방법 1
		for(i = 0 ; i < 26; i += 1) {	
			System.out.print((char)('a' + i) + " ");	
		}
		System.out.println();
		
		
		//  a부터 z까지 출력하는 코드를 작성하세요. 강사님 방법 2
		for(ch = 'a' ; ch <= 'z'; ch += 1) {	
			System.out.print(ch + " ");	
		}
		System.out.println();
	}

}
