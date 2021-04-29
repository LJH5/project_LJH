package day4;

public class For13 {

	public static void main(String[] args) {
		// 이중 반복문을 활용하여 구구단 전체를 출력하는 코드를 작성하세요.
		
		int i, j;
		for(i=2; i<=9; i += 1) {
			for(j=1; j<=9; j += 1) {
				System.out.print(i + " x " + j + " = " + (i*j) + "  ");
			}
			System.out.println();
		}

	}

}
