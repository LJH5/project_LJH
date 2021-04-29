package day4;

public class For15 {

	public static void main(String[] args) {
		// 100 이하의 모든 소수를 출력하는 코드를 작성하세요. *cnt 초기화가 중요함
		int i, num, cnt;
		
		System.out.print("100 이하의 소수: ");
		for(num=1; num<=100; num += 1) {
			for(i=1, cnt=0; i<=num; i += 1) {
				if(num%i == 0) {
					cnt += 1;
				}
			}
			if(cnt == 2) {
				System.out.print(num + " ");
			}
		}	
	}

}