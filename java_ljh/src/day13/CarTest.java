package day13;

public class CarTest {

	public static void main(String[] args) {
		AutoCar ac = new AutoCar("1종", "기아");
		StickCar sc = new StickCar("2종", "현대");
		ac.turnOn();
		ac.setGear('D');
		sc.setGear('2');
		ac.print();
		System.out.println("------------------");
		sc.print();
		
		System.out.println("------------------");
		Car c = ac;   //c는 Car클래스의 객체<= ac는 AutoCar클래스의 객체: 자동으로 클래스가 변환됨
		c.print();
				
		System.out.println("------------------"); 
		//Car c2 = new Car("1종", "기아"); 에러
		Car c2 = new AutoCar("1종", "기아");
		ac = (AutoCar)c2;
		ac.print();
		
		//수동, 자동 따로 관리
		AutoCar []acList = new AutoCar[5];
		StickCar []scList = new StickCar[5];
		acList[0] = ac;
		scList[0] = sc;
		
		// 수동, 자동 같이 관리
		Car []cList = new Car[5];
		cList[0] = ac;
		cList[1] = sc;
	}

}
