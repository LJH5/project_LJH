package kr.green.study.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import kr.green.study.service.MemberService;
import kr.green.study.vo.MemberVO;

public class AutoLoginInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	MemberService memberService;
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO)session.getAttribute("user"); //user는 LoginInterceptor의 setAttribute외 맞춤
						// 부모 -> 자식 명시적 형변환
		
		//세션에 회원 정보가 있으면 자동 로그인 기능을 활용할 필요가 없고, 없으면 자동 로그인을 해야 하는지 확인
		if(user == null) {
			//loginCookie 정보를 가져와서 있으면 로그인을 시도하고, 없으면 안함
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookis");
			//자동 로그인 쿠키정보가 있으면 자동 로그인을 해야함
			if(loginCookie != null) {
				user = memberService.getMemberByCookie(loginCookie.getValue());
				if(user != null)
					session.setAttribute("user", user);
			}
		}
		return true;
	}
	
	
}
