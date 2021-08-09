package kr.green.matboda.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

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
	private Date me_signupDate;
	
	public String getDate() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(me_signupDate);
	}
	
	public String getAuthorityStr() {
		if(me_authority.equals("USER"))
			return "회원";
		if(me_authority.equals("ADMIN"))
			return "관리자";
		if(me_authority.equals("SUPER ADMIN"))
			return "최고 관리자";
		return "";
	}
}
