package day15;

public class NullPointExeptionTest {

	public static void main(String[] args) {
		String name = null;
		
		//객체를 생성하지 않아서 예외 발생
		System.out.println(name.toString());
		
		//배열를 생성하지 않아서 예외 발생
		int []arr = null;
		System.out.println(arr.length);
	
		
		}
	}

}
