package day8;

public class Test8_2 {

	public static void main(String[] args) {
		/* a
		 * ab
		 * abc
		 * abcd
		 * ...
		 * abcd...xyz
		 * 위와 같이 출력
		 */
		
		//나의 방법
		char ch;
		for(int i=0; i<26; i+=1) {
			for(int j=0; j<=i;j+=1) {
				ch = 'a';
				ch+=j;
				System.out.print(ch);
			}
			System.out.println();
		}
		
		//강사님 방법
		for(char i='a'; i<='z'; i+=1) {
			for(char j='a'; j<=i; j+=1) {
				System.out.print(j);
			}
			System.out.println();
		}
		
		//강사님 방법2
		String str = "";
		for(char i = 'a'; i<='z'; i+=1) {
			str+=i;
			System.out.println(str);
		}
	}

}
