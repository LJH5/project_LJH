package day8;

import java.util.Scanner;

public class Test8_1 {

	public static void main(String[] args) {
		// 1~9사이의 정수를 입력받아 각 숫자가 몇번 입력됐는지 출력하는 코드를 작성하세요
		// -1이 입력되면 입력 종료하고 각 숫자가 몇번 입력됐는지 출력
		
		/*
		//나의 방법: 배열에 저장 후 비교, 입력값이 많아질수록 배열이 많아져서 비효율적임
		int []user = new int [10];
		
		
		// 1~9사이의 정수 입력 후 저장, -1 입력되면 종료
		Scanner sc = new Scanner(System.in);
		
		System.out.println("1~9사이의 정수를 입력하세요.('-1' 입력 시 종료)");
		for(int i=0; ; i+=1) {
			System.out.print("입력: ");
			user[i] = sc.nextInt();
			if(user[i]<1 || user[i}>9) {
				break;
			}
		}
		
		for(int j=1; j<user.length; j+=1) {
			int cnt =0;
			for(int i=0; i<user.length; i+=1) {
				if(user[i]==j) {
					cnt+=1;
				}
			}
			System.out.println(j + ": " + cnt + "번");
		}
		sc.close();
		*/
		
		//강사님 방법: 배열의 번지를 이용해서 num 번지의 값을 1씩 증가시킴 
		int num;
		int []arr = new int [10];
		Scanner sc = new Scanner(System.in);
		while(true) {
			System.out.print("입력(1~9): ");
			num=sc.nextInt();
			if(num<1 || num>9) {
				break;
			}
			arr[num]+=1;
		}
		for(int i=1; i<arr.length; i+=1) {
			System.out.println(i + ": " + arr[i] + "번");
		}
		sc.close();
	
	}

	
}
