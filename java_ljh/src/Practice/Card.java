package Practice;

public class Card {
	private String kind;
	private int num;
	private static int width = 100;
	private static int height = 250;
	

	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public static int getWidth() {
		return width;
	}
	public static int getHeight() {
		return height;
	}
	public static void setWidth(int width) {
		Card.width = width;
	}
	public static void setHeight(int height) {
		Card.height = height;
	}

	
}
