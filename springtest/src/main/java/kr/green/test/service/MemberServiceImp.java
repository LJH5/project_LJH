package kr.green.test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.test.dao.MemberDAO;
import kr.green.test.vo.MemberVO;

@Service
public class MemberServiceImp implements MemberService {

	@Autowired
    MemberDAO memberDao;
    
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
		if(dbUser == null || !dbUser.getPw().equals(user.getPw())) {
			return null;
		}
		return dbUser;
	}
}