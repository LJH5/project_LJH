package Practice;

public class TvTest {

	public static void main(String[] args) {
		Tv t = new Tv();
		
		t.channel = 7;
		t.channelDown();
		System.out.println("현재 채널은 "+t.channel+"번 입니다.");
		
		
		Tv[] tvArr = new Tv[3]; //객체 배열 생성
		for(int i=0; i<tvArr.length;i++) {
			tvArr[i] = new Tv();
		}
		

	}

}

class Tv {
	String color;
	int channel;
	boolean power = false;
	

	/* 기능	 : 전원을 켬/끔
	 * 매개변수: 없음
	 * 리턴타입: void
	 * 메소드명: power */
	public void power() {
		power = !power;
	}
	
	/* 기능	 : 채널 올리기
	 * 매개변수: 없음
	 * 리턴타입: void
	 * 메소드명: channelUp */
	public void channelUp() {
		++channel;
	}
	
	/* 기능	 : 채널 내리기
	 * 매개변수: 없음
	 * 리턴타입: void
	 * 메소드명: channelDown */
	public void channelDown() {
		--channel;
	}
}
