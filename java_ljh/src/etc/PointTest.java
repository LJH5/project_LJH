package etc;

public class PointTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
class Point{
	private int x, y;
	
	public Point() {}

	public Point(int x, int y) {
		super();
		this.x = x;
		this.y = y;
	}
	
	public void print() {
		System.out.println("좌표: (" + x + "," + y + ")");
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