package Practice;

public class CardTest {

	public static void main(String[] args) {
		System.out.println("카드 넓이: " + Card.getWidth());
		System.out.println("카드 높이: " + Card.getHeight());
		
		Card cd1 = new Card();
		cd1.setKind("herth");
		cd1.setNum(7);
		
		System.out.println("cd1은 " + cd1.getKind() + " " + cd1.getNum() 
			+ "이고 크기는 " + cd1.getWidth() + ", " + cd1.getHeight());
		
		System.out.println("카드의 크기를 50, 80으로 변경");
		cd1.setWidth(50);
		cd1.setHeight(80);
		
		System.out.println("cd1은 " + cd1.getKind() + " " + cd1.getNum() 
		+ "이고 크기는 " + cd1.getWidth() + ", " + cd1.getHeight());

	}

}
