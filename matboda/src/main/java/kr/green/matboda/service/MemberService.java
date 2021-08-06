package kr.green.matboda.service;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.green.matboda.vo.MemberVO;

public interface MemberService {

	boolean signup(MemberVO user);

	MemberVO signin(MemberVO user);

	Object getMember(String id);

	void signout(HttpServletRequest request, HttpServletResponse response);

	MemberVO getMemberByCookie(String value);

	void keepLogin(String me_id, String id, Date date);

}
