package day7;

import java.util.Scanner;

public class BaseballGame2 {

	public static void main(String[] args) {	
		//컴퓨터가 랜덤으로 중복되지 않은 세 수를 생성
		int [] com = new int[3];
		int min=1, max=9;
		
		//랜덤 생성 테스트(게임 시 지우기)
		init(com, min, max);
		for(int tmp : com) {
			System.out.print(tmp + " ");
		}
		System.out.println();
		
		//3s일 때까지 반복
		int strike = 0, ball =0;
		int []user = new int[3];
		
		Scanner sc = new Scanner(System.in);
		do {
			//숫자 입력
			System.out.print("입력: ");
			for(int i=0; i<user.length; i+=1) {
				user[i]= sc.nextInt();
			}
			
			//스트라이크와 볼의 개수를 셈, 메소드 이용
			strike = getStrike(com, user);
			ball = getBall(com, user);
			
			//스트라이크, 볼, 아웃을 판정, 메소드 이용
			printResult(ball, strike);
		}while(strike<3);
		sc.close();
	}
	
	//중복확인
	public static boolean contains(int arr[], int cnt, int num) {
		if(arr.length<cnt) {
			cnt=arr.length;
		}
		for(int i=0; i<cnt; i+=1) {
			if(arr[i]==num) {
				return true;
			}
		}
		return false;
	}
	
	//컴퓨터가 랜덤으로 중복되지 않은 세 수를 생성
	public static void init(int []arr, int min, int max) { //참조변수를 사용: 원본 값을 변경시키기 위해서
		if(min>max) {
			int tmp = min;
			min=max;
			max=min;
		}
		//중복제거
		int cnt=0;
		while(cnt<arr.length) {
			int r = (int)(Math.random() * (max - min + 1) + min);
					
			if(!contains(arr, cnt, r)) {
				arr[cnt]=r;
				cnt+=1;
			}
		}
	}
	
	//Strike의 개수 세기, 배열 arr1과 arr2에서 같은 위치의 숫자를 비교하여 같은 숫자의 개수를 알려줌
	public static int getStrike(int []arr1, int []arr2) {
		int cnt=0;
		for(int i=0; i<arr1.length; i+=1) {
			if(arr1[i]==arr2[i]) {
				cnt+=1;
			}
		}
		return cnt;
	}
	
	//Ball의 개수 세기, 배열 arr1과 arr2에서 같은 숫자의 개수 - strike의 개수
	public static int getBall(int []arr1, int []arr2) {
		int cnt=0;
		for(int i=0; i<arr1.length; i+=1) {
			if(contains(arr2,arr2.length,arr1[i])) {
				cnt+=1;
			}
		}
		return cnt - getStrike(arr1, arr2);
	}
	
	//ball과 strike의 수에 따라 결과를 출력하는 메소드
	public static void printResult(int ball, int strike) {
		if(strike!=0) {
			System.out.print(strike + "S");
		}
		if(ball!=0) {
			System.out.print(ball + "B");
		}
		if(strike==0 && ball==0) {
			System.out.println("O");
		}
		System.out.println();
	}
}