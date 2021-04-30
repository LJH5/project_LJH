package day5;

public class AdvanceFor {

	public static void main(String[] args) {
		//향상된 for문: 배열이나 컬렉션프레임워크에서 사용가능한 for문, 전체 탐색할 때 사용, 값을 가져올 때 사용, 값을 변경할 때 사용X
		
		//배열 값 변경 편함
		int []arr = {1,2,3,4,5};
		for(int i=0; i<arr.length; i+=1) {
			int tmp = arr[i];				
			System.out.print(tmp + " ");
		}
		System.out.println();
		
		//배열 값 변경 힘듬
		for(int tmp: arr) {
			System.out.print(tmp + " ");
		}

	}

}
