package day8;

public class Test8_4 {

	public static void main(String[] args) {
		// 1부터 10까지 한줄로 출력
		for(int i=1; i<=10; i+=1) {
			System.out.print(i+" ");
		}
		System.out.println("\n-----------------");
		
		/* 아래와 같이 출력
		 * 1 2 3 4
		 * 5 6 7 8
		 * 9 10 
		*/
		for(int i=1; i<=10; i+=1) {
			System.out.print(i+" ");
			if(i%4==0) {
				System.out.println();
			}
		}
		System.out.println("\n-----------------");
		
		/* 아래와 같이 출력
		 * 1,2,3,4
		 * 5,6,7,8
		 * 9,10, 
		*/
		for(int i=1; i<=12; i+=1) {
			System.out.print(i);
			if(i%4==0) {
				System.out.println();
			}else {
				System.out.print(",");
			}
		}
		System.out.println("\n-----------------");
		
		for(int i=1; i<=12; i+=1) {
			System.out.print(i);
			String str= i%4 ==0 ? "\n" : ",";
			System.out.print(str);
		}
		System.out.println("\n-----------------");
		
		/* 다음과 같이 출력되도록 작성
		 * 2 1 4 3
		 * 6 5 8 7
		 * 10 9 12 11
		 */
		//나의 방법
		int cnt=0;
		for(int i=2; i<=13; i+=1) {
			
			if(i%2==1) {
				System.out.print((i-2)+" ");
			}else {
				System.out.print(i+" ");
			}
			cnt+=1;
			if(cnt%4==0) {
				System.out.println();
			}
		}
		System.out.println("\n-----------------");
		//강사님 방법
		for(int i=1; i<=12; i+=1) {
			if(i%2==1) {
				System.out.print(i+1 + " ");
			}else {
				System.out.print(i-1 + " ");
			}
			if(i%4==0) {
				System.out.println();
			}	
		}
		System.out.println("\n-----------------");
	
	
	
	}

}
