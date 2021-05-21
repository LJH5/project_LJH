package day18;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Scanner;

public class SetTest2 {

	public static void main(String[] args) {
		// 중복되지 않은 5개의 수가 입력될때까지 입력한 후, 입력이 완료되면 종료하는 코드를 작성하세요 
		HashSet<Integer> set = new HashSet<Integer>();
		
		Scanner sc = new Scanner(System.in);
		while(set.size() < 5) {
			System.out.print("정수를 입력하세요: ");
			//int num=sc.nextInt();
			//set.add(num);
			set.add(sc.nextInt());
		}
		System.out.print("입력된 정수: ");
		Iterator<Integer> it = set.iterator();
		while(it.hasNext()) {
			//Integer tmp = (Integer) it.next(); //(Integer) 생략 가능
			//System.out.print(tmp+" ");
			System.out.print(it.next()+" ");
		}
		sc.close();
	}

}
