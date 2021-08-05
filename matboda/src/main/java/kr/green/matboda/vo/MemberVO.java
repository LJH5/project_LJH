package kr.green.matboda.vo;

import lombok.Data;

@Data
public class MemberVO {
	private String me_id;
	private String me_pw;
	private String me_nickname;
	private String me_picture;
	private String me_name;
	private String me_email;
	private String me_phoneNum;
	private String me_gender;
	private String me_authority;
	private Boolean useCookie;
}
