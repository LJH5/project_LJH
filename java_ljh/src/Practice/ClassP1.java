package Practice;

public class ClassP1 {

	public static void main(String[] args) {
		
		PointP pt = new PointP(); 		//pt 생성: (0,0)
		
		pt.print(); 
		
		System.out.println();
		
		PointP pt2 = new PointP(1,2); 	//pt2 생성: (1,2)
		pt2.print();
		
		
		//pt를 x축으로 3만큼, y축으로 5만큼 이동
		pt.move(3, 5);
		pt.print();
	}

}
