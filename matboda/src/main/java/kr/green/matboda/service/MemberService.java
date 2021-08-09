package kr.green.matboda.service;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.green.matboda.pagination.Criteria;
import kr.green.matboda.vo.MemberVO;

public interface MemberService {

	boolean signup(MemberVO user);

	MemberVO signin(MemberVO user);

	Object getMember(String id);

	void signout(HttpServletRequest request, HttpServletResponse response);

	MemberVO getMemberByCookie(String value);

	void keepLogin(String me_id, String id, Date date);

	MemberVO getMemberByRequest(HttpServletRequest request);

	ArrayList<MemberVO> getMemberList(MemberVO user, Criteria cri);

	boolean updateAuthority(MemberVO user, MemberVO loginUser);

	int getTotalCount(MemberVO user);

}