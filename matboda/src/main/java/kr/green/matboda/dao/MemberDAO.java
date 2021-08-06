package kr.green.matboda.dao;

import kr.green.matboda.vo.MemberVO;

public interface MemberDAO {

	void insertMember(MemberVO user);

	MemberVO selectUser(String id);

}
