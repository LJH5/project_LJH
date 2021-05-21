package day18;

import java.util.HashSet;
import java.util.Iterator;

public class SetTest3 {

	public static void main(String[] args) {
		// 중복되지 않은 6개의 수를 랜덤으로 생성하여 저장한 후 출력하는 코드를 작성하세요. 단 숫자의 범위는 1~45 
		
		int min=1, max=45;
		HashSet<Integer> set = new HashSet<Integer>();
		while(set.size() < 6) {
			set.add((int)(Math.random() * (max - min + 1) + min));
		}
		
		System.out.print("로또 번호: ");
		Iterator<Integer> it = set.iterator();
		while(it.hasNext()) {
			System.out.print(it.next()+" ");
		}
	}

}
