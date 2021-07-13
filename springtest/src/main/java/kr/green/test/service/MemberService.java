package kr.green.test.service;

import kr.green.test.vo.MemberVO;

public interface MemberService {

	public MemberVO signin(MemberVO user);

	public void signup(MemberVO user);
}
