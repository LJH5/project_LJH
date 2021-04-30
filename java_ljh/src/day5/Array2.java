package day5;

public class Array2 {

	public static void main(String[] args) {
		// 5개짜리 정수 배열에 1~5까지 차례대로 저장 후 출력하는 예제
		int []arr = new int[5];
		arr[0] = 1;
		arr[1] = 2;
		arr[2] = 3;
		arr[3] = 4;
		arr[4] = 5;
		System.out.print(arr[0] + " ");
		System.out.print(arr[1] + " ");
		System.out.print(arr[2] + " ");
		System.out.print(arr[3] + " ");
		System.out.print(arr[4] + " ");
		
		System.out.println();
		
		int []arr2 = new int[5];
		for(int i=0; i<5; i += 1) {
			arr2[i] = i+1;
			System.out.print(arr2[i] + " ");
		}
		System.out.println();
		
		System.out.print(arr2[0] + " ");
		System.out.print(arr2[1] + " ");
		System.out.print(arr2[2] + " ");
		System.out.print(arr2[3] + " ");
		System.out.print(arr2[4] + " ");
	}

}
