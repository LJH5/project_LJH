package day4;

public class For12 {

	public static void main(String[] args) {
		// 중첩 for문, 하나의 *를 이용하여 다음과 같이 출력되도록 작성하세요.
		/* 	*****
		 * 	*****
		 *  *****
		 *  *****
		 *  *****
		 */
		
		int i, j;
		for(i=0; i<5; i += 1) {
			for(j=0; j<5; j += 1) {
				System.out.print("*");
			}
			System.out.println();
		}
		
	}
}