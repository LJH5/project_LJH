package day8;

public class Test8_7 {

	public static void main(String[] args) {
		// 5개짜리 배열에 페어가 몇개 있는지 판별하는 코드를 작성하세요
		
		//나의 방법
		int []arr = new int[] {1,1,1,2,2};
		int cnt=1;
		int pare=0;

		for(int i=0; i<arr.length-1; i+=1) {
			if(arr[i]==arr[i+1]) {
				cnt+=1;
			}else {
				if(cnt==2) {
					pare+=1;
				}
				cnt=1;
			}	
		}
		if(cnt==2) {
			pare+=1;
		}
		System.out.println(pare+"페어");
	}

}
