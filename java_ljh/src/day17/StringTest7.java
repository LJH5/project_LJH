package day17;

public class StringTest7 {

	public static void main(String[] args) {
		//compareTo(): 두 문자열이 같은지를 비교하여 같으면 0, 다르면 사전순에 따라서 1 또는 -1울 반환
		System.out.println("A".compareTo("B"));
		System.out.println("A".compareTo("A"));
		System.out.println("B".compareTo("A"));
		
		//contains(): 해당 문자열이 포함되어 있는지 아닌지 알려주는 메소드, indexOf와 비슷
		System.out.println("Hello".contains("He"));
		System.out.println("Hello".contains("Hi"));
	}

}
