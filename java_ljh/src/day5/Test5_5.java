package day5;

public class Test5_5 {

	public static void main(String[] args) {
		// 1~10 사이의 랜덤한 수를 6개 생성하여 배열에 저장한 후 출력하는 코드를 작성하세요. 단, 랜덤한 수는 중복될 수 있다.
		int i; 
		int min = 1, max = 11;
		int []arr = new int[6];

		for(i=0; i<arr.length; i += 1) {
			arr[i] = (int)(Math.random() * (max - min + 1) + min);
		}
		for(i=0; i<arr.length; i += 1) {
			System.out.print(arr[i] + " ");
		}
		
	}

}
