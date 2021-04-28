package day3;

public class Test3_3 {

	public static void main(String[] args) {
		// 종수가 2의 배수, 3의 배수, 6의 배수, 2,3,6의 배수가 아닌지 판별하는 문제, 이중 if문을 사용하여 작성
		
		int num = 6;
		
		if( num % 2 == 0) {
			if (num % 3 == 0) {
				System.out.println("6의 배수");
			} else {
				System.out.println("2의 배수");
			} 
		} else if (num % 3 == 0) {
			System.out.println(" 3의 배수");
		} else {
			System.out.println("6의 배수");
		}

	}

}
