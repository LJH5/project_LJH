package day5;

import java.util.Scanner;

public class Test5_3 {

	public static void main(String[] args) {
		// 콘솔에서 정수를 5번 입력받아 입력받은 값을 출력하는 코드를 작성하세요
		Scanner sc = new Scanner(System.in);
		
		int num, i;
		 
		for(i=1; i<=5; i += 1) {
			System.out.print("입력 : ");
			num = sc.nextInt();
			System.out.println("출력 : " + num);
		}		
		System.out.println();

		// 콘솔에서 정수를 5번 입력받아 저장한 후 입력받은 값을 출력하는 코드를 작성하세요
		int []arr = new int[5];
		for(i=0; i<5; i += 1) {
			System.out.print("입력 : ");
			arr[i] = sc.nextInt();
			System.out.println("출력 : " + arr[i]);
		}
		
		sc.close();
		
		
	}

}
