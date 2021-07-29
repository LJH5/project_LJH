package kr.green.study.service;

import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.green.study.dao.MemberDAO;
import kr.green.study.vo.MemberVO;
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
		if(user.getId() == null || !Pattern.matches(idRegex, user.getId()))
			return false;
		//비밀번호 유효성 검사
		String pwRegex = "^[a-zA-Z0-9!@#]{8,16}$";
		if(user.getPw() == null || !Pattern.matches(pwRegex, user.getPw()))
			return false;
		//이메일 유효성 검사 xx@yy.zz 또는 xx@yy.zz.cc
		String emailRegex = "\\w+@\\w+\\.\\w+(\\.\\w+)?";
		if(user.getEmail() == null || !Pattern.matches(emailRegex, user.getEmail()))
			return false;
		//이름 유효성 검사
		if(user.getName() == null || user.getName().length() == 0)
			return false;
		//성별 유효성 검사
		if(user.getGender() == null)
			return false;
		//비밀번호 암호화
		String encPw = passwordEncoder.encode(user.getId());
		user.setPw(encPw);
		memberDao.insertMember(user);
		return true;
	}

	@Override
	public MemberVO signin(MemberVO user) {
		//System.out.println(user);
		if(user == null || user.getId() == null)
			return null;
		//System.out.println(1);
		MemberVO dbUser = memberDao.selectUser(user.getId());
		// 잘못된 ID, 회원이 아님
		if(dbUser == null)
			return null;
		//System.out.println(2);
		if(user.getPw() == null || !passwordEncoder.matches(user.getPw(), dbUser.getPw()))
			return null;
		//System.out.println(3);
		// 자동 로그인 기능을 위해서 
		dbUser.setUseCookie(user.getUseCookie());
		return dbUser;
	}

	@Override
	public Object getMember(String id) {
		if(id == null)
			return null;
		return memberDao.selectUser(id);
	}

	@Override
	public void signout(HttpServletRequest request) {
		if(request != null)
			request.getSession().removeAttribute("user");
	}
}
