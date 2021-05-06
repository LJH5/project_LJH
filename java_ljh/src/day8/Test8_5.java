package day8;

import java.util.Scanner;

public class Test8_5 {

	public static void main(String[] args) {
		// 5짜리 배열에 1~5를 저장한 후 출력하는 코드를 작성하세요.
		int []arr = new int[5];
		
		for(int i=0; i<5; i+=1) {
			arr[i]=i+1;
			System.out.print(arr[i] + " ");
		}
		System.out.println("\n-----------------");

		//10개짜리 배열에 피보나피수열을 저장한 후 출력하는 코드를 작성하세요.
		int []arr2=new int[10];
		arr2[0]=arr2[1]=1;
		for(int i=2; i<arr2.length; i+=1) {
			arr2[i]=arr2[i-1]+arr2[i-2];
		}
		for(int j=0; j<arr2.length; j+=1) {
			System.out.print(arr2[j]+" ");
		}
		System.out.println("\n-----------------");
		
		//5개짜리 배열에 저장된 숫자들 중 연속된 숫자 3개가(예: 1, 2, 3) 있는지 확인하는 코드를 작성하세요. 단 숫자들은 정렬되었다고 가정
		int []arr3 = new int[] {1,3,5,6,7};
		int cnt=1;
		for(int i=0; i<arr3.length-1; i+=1){
			if(arr3[i]+1==arr3[i+1]) {
				cnt+=1;
			}else {
				cnt=1;
			}
			if(cnt==3) {
				break;
			}
		}
		if(cnt==3) {
			System.out.println("연속");
		}else {
			System.out.println("연속 아님");
		}
		System.out.println("\n-----------------");
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
