package day12;

public class ForTest {

	public static void main(String[] args) {
		// 조건문과 반복문에서 실행문이 1줄이면 {}를 생략할 수 있음
		for(int i=1; i<=5; i+=1) 
			System.out.println(i+" ");
		int num=2;
		if(num%2==0) 
			System.out.println("짝수");
		else 
			System.out.println("홀수");
		
	}

}
