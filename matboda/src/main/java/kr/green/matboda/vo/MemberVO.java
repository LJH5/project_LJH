package kr.green.matboda.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MemberVO {
	private String me_id;
	private String me_pw;
	private String me_nickname;
	private String me_picture;
	private String me_name;
	private String me_email;
	@DateTimeFormat(pattern="yyyyMMdd")
	private Date me_birthday;
	private String me_phoneNum;
	private String me_gender;
	private String me_authority;
	private Boolean useCookie;
	private Date me_signupDate;
	private int me_reNum;
	private int me_faNum;
	private int me_reviewNum;
	private int me_recommendNum;
	
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
	public int compareAuthority(MemberVO user) {
		if(user == null)
			return -100;
		if(user.getMe_authority().equals(getMe_authority()))
			return 0;
		switch(me_authority) {
		case "USER":
			if(user.getMe_authority().equals("ADMIN") || 
				user.getMe_authority().equals("SUPER ADMIN"))
				return -1;
			return -100;
		case "ADMIN":
			if(user.getMe_authority().equals("SUPER ADMIN"))
					return -1;
			if(user.getMe_authority().equals("USER"))
					return 1;
			return -100;
		case "SUPER ADMIN":
			if(user.getMe_authority().equals("ADMIN") || 
					user.getMe_authority().equals("USER"))
					return 1;
			return -100;
		}
		return -100;
	}
}
