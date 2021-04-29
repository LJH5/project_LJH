package day4;

public class Continue {

	public static void main(String[] args) {
		// continue: 스킵, 특정 위치로 이동, for문에서는 증감식 위치로, while문 은 조건식으로 이동, 항상 if문과 사용
		int i;
		for(i=1; i<=5; i+=1) {
			if(i == 2) {
				continue;	
			}
			System.out.println(i);
			
		}

	}

}
