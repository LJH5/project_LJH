package kr.green.matboda.service;

import java.util.regex.Pattern;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import kr.green.matboda.dao.MemberDAO;
import kr.green.matboda.vo.MemberVO;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MemberServiceImp implements MemberService{

	MemberDAO memberDao;
	BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public boolean signup(MemberVO user) {
		if(user == null)
			return false;
		//아이디 유효성 검사
		String idRegex = "^[a-z0-9_-]{5,20}$";
		if(user.getMe_id() == null || !Pattern.matches(idRegex, user.getMe_id()) )
			return false;
		//비밀번호 유효성 검사
		String pwRegex = "^[a-zA-Z0-9!@#]{8,16}$";
		if(user.getMe_pw() == null || !Pattern.matches(pwRegex, user.getMe_pw()))
			return false;
		//이메일 유효성 검사, xx@yy.zz or xx@yy.zz.cc
		String emailRegex = "\\w+@\\w+\\.\\w+(\\.\\w+)?";
		if(user.getMe_email() == null || !Pattern.matches(emailRegex, user.getMe_email()))
			return false;
		//이름 유효성 검사
		if(user.getMe_name() == null || user.getMe_name().trim().length() == 0)
			return false;
		//성별 유효성 검사
		if(user.getMe_gender() == null)
			return false;
		//비밀번호 암호화
		String encPw = passwordEncoder.encode(user.getMe_pw());
		user.setMe_pw(encPw);
		memberDao.insertMember(user);
		return true;
	}
	
}
