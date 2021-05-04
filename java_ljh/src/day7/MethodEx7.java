package day7;

public class MethodEx7 {

	public static void main(String[] args) {
		int [] arr = new int[] {1,2,3,4,5};
		int num = 3;
		System.out.println(contains(arr, num, arr.length));
		System.out.println(contains(arr, num, 2));
		
		
		initRandomArray(arr,1,9);
		for(int tmp : arr) {
			System.out.print(tmp + " ");
		}
		System.out.println();
		
		arr = initRandomArray2(3,1,9);
		for(int tmp : arr) {
			System.out.print(tmp + " ");
		}
		System.out.println();
	}
	
	/* 기능	 : 배열이 주어지고, 주어진 배열에서 0번지 부터 cnt까지 확인하여 정수 num가 있는지 없는지 확인하는 메소드
	 * 매개변수: int arr[],int num, int cnt
	 * 리턴타입: boolean
	 * 메소드명: contains
	 */
	public static boolean contains(int arr[],int num, int cnt) {
		if(arr.length < cnt) {  
			cnt=arr.length;
		}
		for(int i=0; i<cnt; i+=1) {
			if(arr[i]==num) {
				return true;
			}
		}
		return false;
	}
	
	/* 기능	 : 배열에 랜덤한 수를 생성하여 저장하는 메소드 + 중복되지 않는 랜덤수
	 * 매개변수: int max, int min, int num
	 * 리턴타입: void
	 * 메소드명: initRandomArray
	 */
	public static void initRandomArray(int []arr, int min, int max) { //참조변수를 사용: 원본 값을 변경시키기 위해서
		//예외처리1: 배열이 없을 경우
		if(arr == null){ 
			return;
		}
		
		//예외처리2: min과 max의 자리가 바뀐 경우
		if(min>max) { 
			int tmp = min;
			min=max;
			max=min;
		}
		
		//예외처리3: 랜덤 범위의 개수가 배열의 크기보다 작은 경우
		if(max-min+1<arr.length) {
			return;
		}
		
		//중복제거
		int cnt=0;
		while(cnt<arr.length) {
			int r = (int)(Math.random() * (max - min + 1) + min);
			
			if(!contains(arr, r, cnt)) {
				arr[cnt]=r;
				cnt+=1;
			}
		}
	}		
	
	
	public static int[] initRandomArray2(int size, int min, int max) { //참조변수를 사용: 원본 값을 변경시키기 위해서
		int [] arr = new int[size];
		
		if(min>max) {
			int tmp = min;
			min=max;
			max=min;
		}
		//중복제거
		int cnt=0;
		while(cnt<arr.length) {
			int r = (int)(Math.random() * (max - min + 1) + min);
					
			if(!contains(arr, r, cnt)) {
				arr[cnt]=r;
				cnt+=1;
			}
		}
		return arr;
	}
}
