package kr.green.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.green.spring.service.MemberService;
import kr.green.spring.vo.MemberVO;

@Controller
public class HomeController {
	@Autowired
    MemberService memberService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(ModelAndView mv) {
		mv.setViewName("home");
		return mv;
	}
	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public ModelAndView signinGet(ModelAndView mv) {
		mv.setViewName("signin");
		return mv;
	}
	@RequestMapping(value = "/signin", method = RequestMethod.POST)
	public ModelAndView signinPost(ModelAndView mv, MemberVO user) {
		System.out.println(user);
		// 서비스에게  user의 아이디와 비밀번호를 전달하면 해당 정보가 있는지 없는지 판단 후 DB에 있으면 해당 정보를 없으면 null을 반환
		MemberVO dbUser = memberService.signin(user);
		// 회원정보가 있으면
		if(dbUser != null) {
			// 작업이 다 끝난 후 URI가 /signin이 있는 곳으로 넘어감
			mv.setViewName("redirect:/");
		// 회원 정보가 없으면 
		}else {
			mv.setViewName("redirect:/signin");
		}
		return mv;
	}
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public ModelAndView signupGet(ModelAndView mv) {
		mv.setViewName("signup");
		return mv;
	}
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public ModelAndView signupPost(ModelAndView mv, MemberVO user) {
		System.out.println(user);
		// 서비스에게 아이디를 주면서 회원 가입을 하라고 일을 시키고, 회원 가입이 성공하면 true 아니면 false
		boolean isSignup = memberService.signup(user);
		// 성공하면 메인, 아니면 가입창
		if(isSignup) {
			mv.setViewName("redirect:/");			
		}else {
			mv.setViewName("redirect:/signup");
		}
		return mv;
	}
}
