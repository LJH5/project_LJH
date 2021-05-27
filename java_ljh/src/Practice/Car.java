package Practice;

public class Car {
	//Car의 멤버 변수: 회사명, 모델명, 색상
	String company="현대자동차";
	String model;
	String color;
	int maxSpeed;


	Car(){
		
	}
	
	Car(String model){
		this(model,"은색", 250);
	}
	
	Car(String model, String color){
		this(model, color, 250);
	}
	
	Car(String model, String color, int maxSpeed){
		this.model=model;
		this.color=color;
		this.maxSpeed=maxSpeed;
	}
	
}