package day15;

public class ArrayIndexOutOfBoundsExceptionTset {

	public static void main(String[] args) {
		int []arr = new int[5];
		
		//5개 짜리 배열은 0번지부터 4번지까지 접근할 수 있는 능력을 갖는다
		for(int i=0; i<=arr.length; i++) {
			System.out.println(arr[i]+"");
		}
	}

}
	