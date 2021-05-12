package day12;

public class InheritanceTest1 {

	public static void main(String[] args) {
		
		Parent p = new Parent();
		p.Print();
		
		Child c = new Child();
		c.Print();

	}

}

class Parent{
	
	
	public int num;		 //접근 제한자가 public이면 물려 받음
	private int num2;	 //접근 제한자가 pivate이면 물려받지 못함, 부모클래스에 getter와 setter를 만들어서 사용
	protected int num3;  //접근 제한자가 protected이면 물려 받음
	int num4;			 //접근 제한자가 default이면 같은 패키지가 아닌 경우 물려받지 못함
	public void Print() {
		System.out.println("num: "+ num);
	}
}

class Child extends Parent{
	public void print2() {
		System.out.println("num2: "+ num2); 
		System.out.println("num3: "+ num3);
		System.out.println("num4: "+ num4);
	}
}