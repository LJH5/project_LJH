package day10;

import day10.Point; //같은 패키지에 있는 클래스는 생략가능

public class ClassEx3 {

	public static void main(String[] args) {
		Point pt1= null;
		Point pt2=new Point();
		//pt1.print(); 에러발생: 객체가 생성되지 않은 상태에서 메소드를 호출함
		pt2.print();
		
		pt2.move(4, 5);
		pt2.print();
	}

}
