package kr.green.matboda.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.regex.Pattern;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import kr.green.matboda.dao.MemberDAO;
import kr.green.matboda.pagination.Criteria;
import kr.green.matboda.utils.UploadFileUtils;
import kr.green.matboda.vo.MemberVO;
import kr.green.matboda.vo.RestaurantVO;
import kr.green.matboda.vo.ReviewVO;

@Service
public class MemberServiceImp implements MemberService{
	@Autowired
	private MemberDAO memberDao;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	private String uploadPath = "D:\\JAVA_LJH\\img";
	
	@Override
	public boolean signup(MemberVO user) {
		System.out.println(user);
		if(user == null)
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
	@Override
	public Object getMember(String id) {
		if (id == null) {
			return null;
		}
		return memberDao.selectUser(id);
	}
	@Override
	public void signout(HttpServletRequest request, HttpServletResponse response) {
		if(request == null || response == null)
			return;
		MemberVO user = getMemberByRequest(request);
		if(user == null)
			return;
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		session.invalidate();
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
		if(loginCookie == null)
			return ;
		loginCookie.setPath("/");
		loginCookie.setMaxAge(0);
		response.addCookie(loginCookie);
		keepLogin(user.getMe_id(), "none", new Date());
	}
	@Override
	public MemberVO getMemberByCookie(String me_sessionId) {
		if(me_sessionId == null)
			return null;
		return memberDao.selectUserBySeesion(me_sessionId);
	}
	@Override
	public void keepLogin(String me_id, String me_sessionId, Date me_sessionLimit) {
		if(me_id == null)
			return;
		memberDao.keepLogin(me_id, me_sessionId, me_sessionLimit);
		
	}
	public MemberVO getMemberByRequest(HttpServletRequest request) {
		if(request == null)
			return null;
		return (MemberVO)request.getSession().getAttribute("user");
	}
	@Override
	public ArrayList<MemberVO> getMemberList(MemberVO user, Criteria cri) {
		if(user == null || user.getMe_authority().equals("USER"))
			return null;
		return memberDao.selectUserList(user.getMe_authority(), cri);
	}
	@Override
	public boolean updateAuthority(MemberVO user, MemberVO loginUser) {
		if(user == null || loginUser == null)
			return false;
		if(loginUser.compareAuthority(user) <= 0)
			return false;
		MemberVO dbUser = memberDao.selectUser(user.getMe_id());
		if(dbUser == null)
			return false;
		dbUser.setMe_authority(user.getMe_authority());
		memberDao.updateUser(dbUser);
		return true;
	}
	@Override
	public int getTotalCount(MemberVO user) {
		if(user == null)
			return 0;
		return memberDao.getTotalCount(user.getMe_authority());
	}
	@Override
	public String deleteMember(String me_id, MemberVO user) {
		if(user == null || user.getMe_authority().equals("USER")) {
			return "FAIL";
		}
		MemberVO dbUser = memberDao.selectUser(me_id);
		if(dbUser == null || !dbUser.getMe_id().equals(me_id)) {
			return "FAIL";
		}
		memberDao.deleteMember(me_id);
		return "OK";
	}
	@Override
	public MemberVO updateMember(MemberVO user, MemberVO loginUser, MultipartFile file) throws Exception {
		if(loginUser == null || user == null || user.getMe_id() == null || !user.getMe_id().equals(loginUser.getMe_id()))
			return null;
		MemberVO dbUser = memberDao.selectUser(user.getMe_id());
		String imageName = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
		if(file.getOriginalFilename().equals("") ) {
			dbUser.setMe_picture(dbUser.getMe_picture());
		}else {
			dbUser.setMe_picture(imageName);
		}
		dbUser.setMe_nickname(user.getMe_nickname());
		dbUser.setMe_email(user.getMe_email());
		dbUser.setMe_phoneNum(user.getMe_phoneNum());
		memberDao.updateUser(dbUser);
		return dbUser;
	}
	@Override
	public void deleteMember(MemberVO user) {
		if(user == null)
			return;
		memberDao.deleteMember(user.getMe_id());
		return;
	}
	@Override
	public int getReviewCountById(MemberVO user, Criteria cri) {
		if(user == null)
			return 0;
		return memberDao.selectReviewCountById(user, cri);
	}
	@Override
	public int getFavoritesCountById(MemberVO user, Criteria cri) {
		if(user == null)
			return 0;
		return memberDao.selectFavoritesCountById(user, cri);
	}
	@Override
	public ArrayList<ReviewVO> getReviewById(MemberVO user, Criteria cri) {
		if(user == null)
			return null;
		return memberDao.selectReviewById(user, cri);
	}
	@Override
	public ArrayList<RestaurantVO> getRestaurantByFavorites(MemberVO user, Criteria cri) {
		if(user == null)
			return null;
		return memberDao.selectRestaurantByFavorites(user, cri);
	}
}
