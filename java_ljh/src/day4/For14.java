package day4;

public class For14 {

	public static void main(String[] args) {
		// 정수 num가 소수인지 아닌지 판별하는 코드를 작성하세요.
		int i, num, cnt;
		
		num = 123;
		cnt = 0;
		
		for(i=1; i<=num; i += 1) {
			if(num%i == 0) {
				cnt += 1;
			}
		}
		if(cnt == 2) {
			System.out.println(num + "은/는 소수입니다.");
		} else {
			System.out.println(num + "은/는 소수가 아닙니다.");
		}
	}
}