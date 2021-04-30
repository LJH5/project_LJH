package day5;

import java.util.Scanner;

public class Array3 {

	public static void main(String[] args) {
		// 정수 num의 약수를 배열에 쵀대 10개까지 저장한 후 출력하는 코드를 작성하세요
		
		
		int i, cnt; //cnt: arr배열의 번지 & 저장된 약수의 개수를 의미
		int []arr = new int[10];
		
		Scanner sc = new Scanner(System.in);
		System.out.print("정수를 입력하세요: ");
		int num = sc.nextInt();
		
		
		for(i=1, cnt=0; i<=num; i += 1) {
			if(num%i == 0) {
				arr[cnt] = i;
				cnt += 1;
				if(cnt == 10) {
					break;
				}
			}
		}
		for(i=0; i<cnt; i+=1) {
			System.out.print(arr[i] + " ");
		}
		
		sc.close();
	}
}
