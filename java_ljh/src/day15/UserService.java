package day15;

public interface UserService { 
	/* 기능	 : 회원의 아이디와 비밀번호가 주어졌을 때 로그인 가능 여부를 알려주는 메소드
	 * 매개변수: String id, String pw
	 * 리턴타입: boolean
	 * 메소드명: login
	 */
	boolean login(String id, String pw);
	
	/* 기능	 : 회원의 아이디, 비밀번호, 이메일, 전화번호가 주어지면 해당 정보로 회원가입하여 가입 여부를 알려주는 메소드
	 * 매개변수: String id, String pw, String email, String phoneNum => User user
	 * 리턴타입: boolean
	 * 메소드명: signup
	 */
	boolean signup(User user);
	
	/* 기능	 : 회원의 이메일, 전화번호를 수정하는 메소드
	 * 매개변수: String eMail, String phoneNum => User user
	 * 리턴타입: void
	 * 메소드명: modifyUser
	 */
		void modifyUser(User user);
}
class User{
	String id;
	String pw;
	String email;
	String num;
}