package kr.green.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.green.test.service.MemberService;
import kr.green.test.vo.MemberVO;

@Controller
public class MemberController {
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
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
		MemberVO dbUser = memberService.signin(user);
		if(dbUser != null) {
			mv.setViewName("redirect:/");
		}
		else {
			mv.setViewName("redirect:/signin");
		}
		mv.addObject("user",dbUser);
		return mv;
	}
}
