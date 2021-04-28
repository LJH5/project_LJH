package day3;

public class Switch1 {

	public static void main(String[] args) {
		// switch 문을 이용한 롷짝 판별 예제
		
		int num = 4;
		
		switch(num % 2) {
		case 0:  //case의 값으로는 정수형과 문자열만 가능
			System.out.println("짝수");
			break;
		default:
			System.out.println("홀수");
		}

	}

}
