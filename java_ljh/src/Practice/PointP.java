package Practice;

public class PointP{
	private int x, y; 

	public PointP(int x, int y) { //생성자
		this.x=x;
		this.y=y;
	}
	
	public PointP() {}
	
	
	/*
	 * 기능	 : 멤버변수 x,y좌표를 출력하는 기능
	 * 매개변수: 없음(멤버변수 x,y를 이용)
	 * 리턴타입: void
	 * 메소드명: print
	 */
	
	public void print() {
		System.out.print("("+x+", "+y+")");
	}
	
	/*
	 * 기능	 : 멤버변수 x,y좌표를 이동하는 기능
	 * 매개변수: int x, int y
	 * 리턴타입: void
	 * 메소드명: move
	 */
	public void move(int x, int y) {
		this.x=x;
		this.y=y;
	}

	public int getX() {
		return x;
	}

	public void setX(int x) {
		this.x = x;
	}

	public int getY() {
		return y;
	}

	public void setY(int y) {
		this.y = y;
	}
	


}

