package kr.green.test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.green.test.dao.MemberDAO;
import kr.green.test.vo.MemberVO;

@Service
public class MemberServiceImp implements MemberService {

	@Autowired
    MemberDAO memberDao;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
    
    @Override
    public String getEmail(String id) {
        return memberDao.getEmail(id);
    }

	@Override
	public MemberVO signin(MemberVO user) {
		if(user == null || user.getId() == null) {
			return null;
		}
		MemberVO dbUser = memberDao.getMember(user.getId());
		if(dbUser == null || !passwordEncoder.matches(user.getPw(), dbUser.getPw())) {
			return null;
		}
		return dbUser;
	}

	@Override
	public boolean signup(MemberVO user) {
		if(user == null || memberDao.getMember(user.getId()) != null) {
			return false;
		}
		String encPw = passwordEncoder.encode(user.getPw());
		user.setPw(encPw);
		memberDao.signup(user);
		return true;
	}
}