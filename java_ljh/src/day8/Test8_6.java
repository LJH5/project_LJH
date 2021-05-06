package day8;

public class Test8_6 {

	public static void main(String[] args) {
		// 5개짜리 배열에 같은 숫자가 연속으로 2개 있는지 없는지 판별하는 코드를 작성하시오. 단, 같은 숫자가 3개일 경우 "없음" 출력
		
		//나의 방법
		int []arr = new int[] {1,5,4,1,2};
		int cnt=1;
		boolean res = false;

		for(int i=0; i<arr.length-1; i+=1) {
			if(arr[i]==arr[i+1]) {
				cnt+=1;
			}else {
				if(cnt==2) {
					res=true;
				}
				cnt=1;
			}
			
		}
		if(cnt==2) {
			res=true;
		}
		
		if(res) {
			System.out.println("있음");
		} else {
			System.out.println("없음");
		}
	}

}
