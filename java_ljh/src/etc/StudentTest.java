package etc;

public class StudentTest {

	public static void main(String[] args) {
		Student st = new Student(1, 1, 1, "홍길동");
		
		st.print();
	}

}
class Student{
	private int grade, classNum, num;
	private String name;
	
	public void print() {
		System.out.println("학생 정보: " + grade + "학년 " + classNum+ "반 " + num + "번 " + name);
	}
	public Student() {}
	public Student(int grade, int classNum, int num, String name) {
		this.grade = grade;
		this.classNum = classNum;
		this.num = num;
		this.name = name;
	}
	
	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public int getClassNum() {
		return classNum;
	}

	public void setClassNum(int classNum) {
		this.classNum = classNum;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}
                                
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
