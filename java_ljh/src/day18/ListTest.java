package day18;

import java.util.ArrayList;

public class ListTest {

	public static void main(String[] args) {
		// List: 인터페이스, 순서 보장, 중복 가능, 1개의 데이터 관리
			// ArrayList: List의 구현클래스, 배열로 된 리스트, 탐색이 빠름, 중간 삽입/삭제가 느름
			// LinkedList: List의 구현클래스, 연결로된 리스트, 탐색이 느림, 중산 삽입/삭제가 빠름
		
		// <>제네릭 클래스: 멤버 변수/메소드의 타입이 객체를 생성할 때 결정되는 클래스, 타입은 클래스로, 일반변수 불가능
		ArrayList<String> list = new ArrayList<String>();
		// add(): 리스트에 추가
		for(int i = 0; i<10; i++) {
			list.add("학원 출근");
		}
		list.add("수업");	//리스트가 꽉차면 자동으로 크기를 늘림
		// get(n): n번지에 있는 값을 가져옴
		System.out.println(list.get(10));
		System.out.println("리스트의 크기: "+list.size());
		list.add(10,"아침식사");
		System.out.println(list.get(10));
		System.out.println("리스트의 크기: "+list.size());
		//set(n,a): n번지에 a를 설정(덮어쓰기)
		list.set(10, "간식");
		System.out.println(list.get(10));
		System.out.println("리스트의 크기: "+list.size());
		//indexOf(): 값이 리스트에 있는지 없는지 확인하여 있으면 번지를 없으면 -1을 반환,
		//해당 클래스의 equals()를 호출하여 같은지 확인
		System.out.println("리스트에 간식은 "+list.indexOf("간식")+"번지");
		System.out.println("리스트에 간식은 "+list.indexOf("저녁")+"번지");
		//contains(): 깂이 리스트에 있는지 없는지 확인하는 메소드, equals() 사용
		System.out.println("리스트에 간식이 있다? "+list.contains("간식"));
		System.out.println("리스트에 저녁이 있다? "+list.contains("저녁"));
		//clear(): 리스트를 비움
		list.clear();
		System.out.println("리스트의 크기: "+list.size());
		//isEmpty(): 리스트가 비어있는지 알려주는 메소드
		System.out.println("리스트가 비어 있습니까?" + list.isEmpty());
		list.add("출근");
		list.add("준비");
		list.add("수업");
		list.add("점심");
		//remove(): 해당 번지의 값을 제거, 값과 일치하는 내용을 제거
		System.out.println("리스트 0번지: "+list.get(0));
		list.remove(0);
		System.out.println("리스트 0번지: "+list.get(0));
		list.remove("준비");
		System.out.println("리스트 0번지: "+list.get(0));
		
		
		
		// Map: key와 value로 이루어짐, key는 중복 불가, value는 중복 가능 2개의 데이터 관리
		
		
	}

}
