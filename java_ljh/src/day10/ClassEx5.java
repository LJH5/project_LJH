package day10;

public class ClassEx5 {

	public static void main(String[] args) {
		/* Circle 클래스를 이용하여 원 객체를 생성한 후 테스트하는 예제 */
		Circle c1 = new Circle();
		c1.print();
		
		//중심점을 5,5로 이동
		c1.move(5, 5);
		
		//반지름의 길이를 5로 변경
		c1.setR(5);
		
		c1.print();
	}

}
