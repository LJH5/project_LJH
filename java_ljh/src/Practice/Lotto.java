package Practice;

import java.util.Scanner;

public class Lotto {

	public static void main(String[] args) {
		//사용자 번호를 랜덤생성, 담첨번호를 입력하면 당첨, 6개 + 보너스 볼 1
		//1등: 당첨번호 6개, 2등: 당첨번호 5개 + 보너스, 3등: 당첨번호 5개, 4등: 당첨번호 4개, 5등: 당첨번호 3개, 꽝: 당첨번호 2개 이하
		
		int []user = new int[6];
		int []lotto = new int[6];
		int bonus;
		
		int min=1, max=45;
		
		init(user, min, max);
				
		printArray(user);
		
		Scanner sc = new Scanner(System.in);
		System.out.print("당첨 번호를 입력하세요: ");
		for(int i=0; i<lotto.length; i+=1) {
			lotto[i] = sc.nextInt();
		}
		
		System.out.print("보너스 번호를 입력하세요: ");
		bonus = sc.nextInt();
		
		printRank(user, lotto, bonus);
		sc.close();
	}

	
	//중복 확인
	public static boolean contains(int []arr,int cnt, int num) {
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
	
	
	//로또번호(1~45) 랜덤으로 생성 및 저장
	public static void init(int []arr, int min, int max) { 
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
	
	//같은 수가 몇개있는지 알려주는 
	public static int getSameCount(int []arr1, int []arr2) {
		int cnt=0;
		for(int i=0; i<arr1.length; i+=1) {
			if(arr1[i]==arr2[i]) {
				cnt+=1;
			}
		}
		return cnt;
	}
	
	public static void printArray(int []arr) {
		for(int i=0; i<arr.length; i+=1) {
			System.out.print(arr[i] + " ");
		}
	}
	
	public static int rank(int []user, int []lotto, int bonus) {
		int cnt = getSameCount(user, lotto);
		int rank=0;
		switch(cnt) {
		case 6: rank=1; break;
		case 5: rank= contains(user, user.length, bonus)?2:3; break;
		case 4: rank=4; break;
		case 3: rank=5; break;
		
		}
		return rank;
	}
	
	public static void printRank(int []user, int []lotto, int bonus	) {
		int rank = rank(user,lotto,bonus);
		switch(rank) {
		case 1, 2, 3, 4, 5:
			System.out.println(rank + "등입니다.");
			break;
		default:
			System.out.println("꽝입니다.");
		}
		
	}
}
