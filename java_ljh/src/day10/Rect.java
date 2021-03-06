package day10;

public class Rect {
	//사각형 만들기
	private Point leftUp;
	private Point rightDown;
	private int width, height;
	
	/* 기능	 : 사각형의 정보를 출력하는 메소드
	 * 매개변수: 없음
	 * 리턴타입: void
	 * 메소드명: print
	*/
	public void Print() {
		System.out.print("왼쪽위 점: ");
		leftUp.print();
		System.out.print("오른쪽아래 점: ");
		rightDown.print();
		System.out.println("넓이: " + width);
		System.out.println("높이: " + height);
	}
	
	//기본생성자: 왼쪽위의 점을 나타내는 객체를 생성, 오른쪽아래의 점을 나타내는 객체를 생성
	public Rect() {
		leftUp = new Point();
		rightDown = new Point();
	}
	
	//생성자	: 좌상점과 우하점이 주어지면 해당 점을 이용한 사각형이 되도록 초기화. 좌상점, 우하점, 너비와 높이도 초기화
	//매개변수:
	
	public Rect(int x1, int y1, int x2, int y2) {
		leftUp = new Point(x1, y1);
		rightDown = new Point(x2, y2);
	 	width= x2-x1;
	 	height=y1-y2;
	}
	
	// 방법2, 불완전, 참조변수를 대입연산자로 사용하면 원본을 공유해서 한 쪽이 내용을 변경하면 같이 변경됨
	public Rect(Point lu, Point rd) { 
		//leftUp=lu;		//lu와 leftUp은 같은 정보를 공유
		//rightDown=rd;		//rd와 rihgtDown은 같은 정보를 공유
		
		leftUp = new Point(lu);
		rightDown = new Point(rd);
		width= rightDown.getX()-leftUp.getX();
	 	height=leftUp.getY()-rightDown.getY();
	}
	
	/* 기능	 : 주어진 좌표로 왼쪽 위의 점을 이동시키는 메소드
	 * 매개변수: leftUp 좌표
	 * 리턴타입: void
	 * 메소드명: move
	*/
	public void move(int x1, int y1) {
		//왼쪽위의 점을 이동
		leftUp.move(x1, y1);
		//오른쪽아래의 점을 이동
		//x1을 기준으로 너비만큼 더해주고, y1을 기준으로 높이만큼 빼주면 됨
		rightDown.move(x1+width, y1-height);
	}
	
	/* 기능	 : 왼쪽 위의 점을 기준으로 사각형의 너비와 높이를 변경하는 메소드
	 * 매개변수: int w, int h
	 * 리턴타입: void
	 * 메소드명: resize
	*/
	public void resize(int w, int h) {
		width=w;
		height=h;
		rightDown.move(leftUp.getX()+w, leftUp.getY()-h);
		
	}
	
	
	
	public Point getLeftUp() {
		return leftUp;
	}
	public void setLeftUp(Point leftUp) {
		this.leftUp = leftUp;
	}
	public Point getRightDown() {
		return rightDown;
	}
	public void setRightDown(Point rightDown) {
		this.rightDown = rightDown;
	}
	public int getWidth() {
		return width;
	}
	public void setWidth(int width) {
		this.width = width;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	
	
}
