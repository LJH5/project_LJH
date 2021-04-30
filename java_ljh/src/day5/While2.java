package day5;

public class While2 {

	public static void main(String[] args) {
		// While문과 Continue를 이용한 짝수 출력 예제
		int i, num;
		
		i = 1;
		num = 10;
		
		while(i<=10) {
			if(i%2 != 0) {
				i += 1; //이 코드 없으면 무한루프에 빠진다.
				continue;
			}
			System.out.println(i + " ");
			i += 1;
		}
		
		
		i = 0;
		
		while(++i<=10) {  // 증감연산자 전위형을 사용
			if(i%2 != 0) {
				continue;
			}
			System.out.println(i + " ");
		}

	}

}
