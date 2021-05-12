package day12;

public class InheritanceTest2 {

	public static void main(String[] args) {
		// 자식클래스의 생성자를 호출하면 자식클래스의 생성자가 실행되는데, 자식클래스 생성자 안에 부모생성자가 있어 먼저 호출이 됨
		// 자식클래스의 생성자 안에 부모클래스의 생성자가 없으면 부모클래스의 기본 생성자가 자동으로 호출 됨
		SmaertPhone sp = new SmaertPhone("010-1111-1111", "빨강", "갤럭시");
		sp.print();
	}

}
//폰 클래스
class Phone{
	private String num;
	private String color;
	private String model;
	
	public Phone(String num, String color, String model) {
		System.out.println("폰 생성자입니다.");
		this.num = num;
		this.color = color;
		this.model = model;
	}
	public Phone() {
		System.out.println("폰 기본 생성자입니다."); 
	}
	public void print() {
		System.out.println("번호: " + num);
		System.out.println("색상: " + color);
		System.out.println("모델: " + model);
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
}
//스마트폰 클래스
class SmaertPhone extends Phone{  
	int camera; //카메라 화소 (단위 만)
	public SmaertPhone(String num, String color, String model) {
		//부모클래스의 생성자가 없으면 super()가 생략되어 있음
		//System.out.println(); super() 위에 코드가 있으면 에러,
		super(num, color, model);//부모클래스의 생성자를 호출
		this(); // 에러: 본인 클래스의 생성자 this()를 이용할 수 없음, 부모클래스의 생성자를 2번 호출하는 경우이기 때문에
		System.out.println("스마트폰 생성자입니다.");
		//this.setColor(color);
		//this.setModel(model);
		//this.setNum(num);
	}
	public SmaertPhone() {
		//super(); 생략
	}
}