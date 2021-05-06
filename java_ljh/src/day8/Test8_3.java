package day8;

import java.util.Scanner;

public class Test8_3 {

	public static void main(String[] args) {
		// 4개의 성적을 입력받아 합격인지 불합격인지 판별하는 코드를  작성
		// 합격기준: 모든 성적이 과락이 없어야함, 평균 60점이상
		// 과락: 성적이 40 미만인 경우
		
		//나의 방법
		int []arr = new int[4];
		int sum=0;
		double avg=0;
		boolean fail = false;
		
		Scanner sc = new Scanner(System.in);
		System.out.print("4개의 성적을 입력하세요.: ");
		for(int i=0; i<arr.length; i+=1) {
			arr[i] = sc.nextInt();
			if(arr[i]<0 || arr[i]>100) {
				System.out.println("성적이 잘못 입력되었습니다.");
			}
			sum+=arr[i];
			
			if(arr[i]<40) {
				fail=true;
				break;
			}
		}
		sc.close();
		
		avg = (double)sum/arr.length;
		if(avg<60) {
			fail=true;
		}
		
		if (fail) {
			System.out.println("불합격");
		} else {
			System.out.println("합격");
		}
		
		//강사님 방법
		int []score = new int[4];
		Scanner scan = new Scanner(System.in);
		for(int i=0; i<score.length; i+=1) {
			score[i]=scan.nextInt();		
		}
		scan.close();
		
		int sum1=0;
		boolean pass=true;
		for(int tmp : score) {
			sum1+=tmp;
		}
		double avg1=(double)sum/score.length;
		if(avg<60) {
			pass=false;
		}
		for(int tmp : score) {
			if(tmp<40) {
				pass=false;
			}
		}
		if(pass) {
			System.out.println("합격");
		} else {
			System.out.println("불합격");
		}
	}

}
