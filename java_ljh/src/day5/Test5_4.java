package day5;

import java.util.Scanner;

public class Test5_4 {

	public static void main(String[] args) {
		// 학생 3명의 성적을 입력 받은 후 총점과 평균을 출력하는 코드를 작성하세요.
		
		//배열 사용x
		int i, score, sum = 0, avg = 0;
		
		Scanner sc = new Scanner(System.in);
		for(i=1; i<=3; i += 1) {
			System.out.print("점수를 입력하세요: ");
			score = sc.nextInt();
			sum += score;
		}
		avg=sum/i;	
		System.out.println("총점: " + sum + "점, 평균: " + avg + "점");
		sc.close();
		
		//배열 사용
		int aSum = 0;
		double	aAvg = 0;
		int [] aScore = new int[3];
		
		for(i=0; i<aScore.length; i += 1) {
			System.out.print("점수를 입력하세요: ");
			aScore[i] = sc.nextInt();
			aSum += aScore[i];
		}
		aAvg=(double)aSum/aScore.length;	
		System.out.println("총점: " + aSum + "점, 평균: " + aAvg + "점");
		sc.close();
		
	}
}