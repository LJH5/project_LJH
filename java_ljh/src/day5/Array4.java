package day5;

public class Array4 {

	public static void main(String[] args) {
		//1에서 10사이의 정수 3개를 랜덤으로 생성하여 배열에 저장한 후 출력 및 생성된 값들이 중복되었는지 확인하는 코드를 작성
		int i, j; 
		int min = 1, max = 10;
		int []arr = new int[3];
		
		System.out.print("랜덤: ");
		
		for(i=0; i<arr.length; i += 1) {	// 정수 3개 랜덤 생성 및 배열에 저장
			arr[i] = (int)(Math.random() * (max - min + 1) + min);
		}
		
		for(i=0; i<arr.length; i += 1) { 	// 배열 출력
			System.out.print(arr[i] + " ");
		}
		boolean isDup = false; // 중복 확인
		for(i=0; i<arr.length-1; i += 1) {	
			for(j=i+1; j<arr.length; j += 1) {
				if(arr[i] == arr[j]) {
					isDup = true;
				}
			}
		}
		if(isDup) {
			System.out.println("중복");
		} else {
			System.out.println("중복 아님");
		}
	}

}
