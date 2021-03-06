package kr.green.spring.vo;

import lombok.Data;

@Data
public class MemberVO {
	private String id;
	private String pw;
	private String gender;
	private String email;
	private String name;
	private String authority;
	private Boolean useCookie; //boolean + null => Boolean
}
