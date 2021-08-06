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
		if(user.getMe_id() == null || !Pattern.matches(idRegex, user.getMe_id()))
			return false;
		//비밀번호 유효성 검사
		String pwRegex = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,16}$";
		if(user.getMe_pw() == null || !Pattern.matches(pwRegex, user.getMe_pw()))
			return false;
		//이름 유효성 검사
		String nameRegex = "^[가-힣a-zA-Z]+$";
		if(user.getMe_name() == null || !Pattern.matches(nameRegex, user.getMe_name()))
			return false;
		//이메일 유효성 검사, xx@yy.zz or xx@yy.zz.cc
		String emailRegex = "\\w+@\\w+\\.\\w+(\\.\\w+)?";
		if(user.getMe_email() == null || !Pattern.matches(emailRegex, user.getMe_email()))
			return false;
		//전화번호 유효성 검사
		String phoneNumRegex = "^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$";
		if(user.getMe_phoneNum() == null || !Pattern.matches(phoneNumRegex, user.getMe_phoneNum()))
			return false;
		//성별 유효성 검사
		if(user.getMe_gender() == null)
			return false;
		//별명
		if(user.getMe_nickname() == null)
			user.setMe_nickname(user.getMe_name());
		//비밀번호 암호화
		String encPw = passwordEncoder.encode(user.getMe_pw());
		user.setMe_pw(encPw);
		memberDao.insertMember(user);
		return true;
	}
	@Override
	public MemberVO signin(MemberVO user) {
		if(user == null || user.getMe_id() == null)
			return null;
		MemberVO dbUser = memberDao.selectUser(user.getMe_id());
		if(dbUser == null)
			return null;
		if(user.getMe_pw() == null || !passwordEncoder.matches(user.getMe_pw(), dbUser.getMe_pw()))
			return null;
		dbUser.setUseCookie(user.getUseCookie());
		return dbUser;
	}
	
}
