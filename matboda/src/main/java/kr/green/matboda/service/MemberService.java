package kr.green.matboda.service;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

import kr.green.matboda.pagination.Criteria;
import kr.green.matboda.vo.MemberVO;
import kr.green.matboda.vo.ReviewVO;

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
	
	String deleteMember(String me_id, MemberVO user);

	MemberVO updateMember(MemberVO user, MemberVO loginUser, MultipartFile file) throws Exception;

	void deleteMember(MemberVO user);

	int getReviewCountById(MemberVO user, Criteria cri);
	
	int getFavoritesCountById(MemberVO user, Criteria cri);

	ArrayList<ReviewVO> getReviewById(MemberVO user, Criteria cri);

}
