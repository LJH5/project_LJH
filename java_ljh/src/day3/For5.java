package day3;

public class For5 {

	public static void main(String[] args) {
		// 1부터 5까지의 합을 구하는 예제
		int i, sum;
		sum = 0;
		
		for(i=1; i<=5; i++) {
			System.out.print(i);
			sum += i;
			
			if(i == 5) {
				System.out.print(" = " + sum);
			} else {
				System.out.print(" + ");
			}
				
		}
	}

}
