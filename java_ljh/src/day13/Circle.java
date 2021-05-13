package day13;

public class Circle extends Figure {
	//원을 그릴때 좌상점과 우하점으로 그린다면 중심점은 실수로 해야하고 타원이 생길 수 있다. 따라서 원을 그릴때는 중심점과 반지름을 기준으로 그린다.
	private int x, y;
	private int r;
	public Circle(int x, int y, int r) {
		super(x-r, y-r, x+r, y+r);
		this.x=x;
		this.y=y;
		this.r=r;
	}
	
	@Override
	public void print() {
		System.out.println("<<원입니다>>");
		System.out.println("중심점: ("+x+","+y+")");
		System.out.println("반지름: "+r);
	}
}
