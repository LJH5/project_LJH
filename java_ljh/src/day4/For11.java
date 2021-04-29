package day4;

public class For11 {

	public static void main(String[] args) {
		// 두 정수의 최소 공배수를 구하는 코드를 작성하세요 
		int num1, num2, i;
		
		num1=6;
		num2=7;
		
		for(i=1; ; i+=1) {
			if(i%num1==0 && i%num2==0) {
				System.out.println(i);
				break;
			}
		}
		
		//방법2
		for(i=1; ;i+=1) {
			if(num1*i%num2==0) {
				System.out.println(num1*i + " ");
				break;	
			}
		}
		
		//강사님 방법
		for(i=num1; ; i+=num1) {
			if(i%num2==0) {
				System.out.println(i);
				break;
			}
		}
	
	}
}