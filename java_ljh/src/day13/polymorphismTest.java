package day13;

public class polymorphismTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Car2 c =new Car2();
		c.frontLeftTire = new KumhoTire();
		c.frontRightTire = new KumhoTire();
		c.backLeftTire = new HankookTire();
		c.backRightTire = new HankookTire();
		
		//사고 후 앞 왼쪽 바퀴를 한국타이어로 교체
		c.frontLeftTire = new HankookTire();
		
		boolean isOK = confirm(c.frontLeftTire);
		boolean isOK2 = confirm(c.backRightTire);
	}
	//기능	: 타이어에 이상이 있는지 없는지 알려주는 메소드
	//매개변수: Tier t
	//리턴타입: boolean
	//메소드명: confirm
	//매개변수의 다형성 확인, instanceof를 사용하면 매개변수의 다형성을 처리하기 쉬워짐
	public static boolean confirm(Tire t) {
		//타이어 t가 한국타이어면 예외가 발생하지 않고, 금호타이어면 예외가 발생함
		if(t instanceof HankookTire) {
			HankookTire ht = (HankookTire)t;
			System.out.println("한국 타이어 검사 끝!");
			//한국 타이어에 검사하는 코드 작성했다고 가정
		}else if(t instanceof KumhoTire) {
			KumhoTire kt = (KumhoTire)t;
			System.out.println("금호 타이어 검사 끝!");
			//한국 타이어에 검사하는 코드 작성했다고 가정
		}
		return false;
	}

}

class Car2{ 
	//멤버변수(필드)의 다형성
	public Tire frontLeftTire;
	public Tire frontRightTire;
	public Tire backLeftTire;
	public Tire backRightTire;
}

class Tire{
}

class KumhoTire extends Tire{
	
}

class HankookTire extends Tire{
	
}