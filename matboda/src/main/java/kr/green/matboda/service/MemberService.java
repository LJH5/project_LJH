package kr.green.matboda.service;

import javax.servlet.http.HttpServletRequest;

import kr.green.matboda.vo.MemberVO;

public interface MemberService {

	boolean signup(MemberVO user);

	MemberVO signin(MemberVO user);

	Object getMember(String id);

	void signout(HttpServletRequest request);

}
