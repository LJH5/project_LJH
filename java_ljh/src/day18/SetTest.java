package day18;

import java.util.HashSet;
import java.util.Iterator;

public class SetTest {

	public static void main(String[] args) {
		// Set: 중복 불가능, 순서 보장x, 1개의 데이터 관리
		HashSet<Integer> set = new HashSet<Integer>();
		set.add(10);
		set.add(10);
		set.add(9);
		set.add(4);
		set.add(5);
		set.add(7);
		set.add(3);
		set.add(1);
		System.out.println("set의 크기: " + set.size());
		System.out.println("set에 10이 있습니까? "+ set.contains(10));
		System.out.println("set에 11이 있습니까? "+ set.contains(11));
		System.out.println("set이 비어있습니까? "+set.isEmpty());
		
		//Iterator<>:반복을 하는 객체
		Iterator<Integer> it = set.iterator();
		while(it.hasNext()) {
			Integer tmp = (Integer) it.next(); //(Integer) 생략 가능
			System.out.println(tmp+" ");
		}
		System.out.println();
		
		System.out.println("set에 10의 값이 삭제되었습니까?"+set.remove(10));
		System.out.println("set에 100의 값이 삭제되었습니까?"+set.remove(100));
		
		//clear(): 비우기
		set.clear();
		System.out.println("set의 크기: " + set.size());
	}

}
