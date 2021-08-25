package kr.green.matboda.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.green.matboda.service.MemberService;
import kr.green.matboda.vo.MemberVO;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("/member")
public class MemberController {
	
	MemberService memberService;
	
	@GetMapping("/signup")
	public ModelAndView memberSignupGet(ModelAndView mv) {
		
		mv.addObject("title", "회원가입");
		mv.setViewName("/template/member/signup");
		return mv;
	}
	@PostMapping("/signup")
	public ModelAndView memberSignupPost(ModelAndView mv, MemberVO user) {
		memberService.signup(user);
		mv.setViewName("redirect:/");
		return mv;
	}
	@GetMapping("/signin")
	public ModelAndView memberSigninGet(ModelAndView mv) {
		mv.addObject("title", "로그인");
		mv.setViewName("/template/member/signin");
		return mv;
	}
	@PostMapping("/signin")
	public ModelAndView memberSigninPost(ModelAndView mv, MemberVO user) {
		MemberVO loginUser = memberService.signin(user);
		if(loginUser != null)
			mv.setViewName("redirect:/");
		else
			mv.setViewName("redirect:/member/signin");
		mv.addObject("user", loginUser);
		return mv;
	}
	@ResponseBody
	@PostMapping("/id/check")
	public String idCheck(String id) {
		return memberService.getMember(id) != null ? "FAIL" : "OK";
	}
	@GetMapping("/signout")
	public ModelAndView memberSignoutGet(ModelAndView mv, HttpServletRequest request, HttpServletResponse response ) {
		memberService.signout(request, response);
		mv.setViewName("redirect:/");
		return mv;
	}
	@GetMapping("/mypage")
	public ModelAndView memberMypageGet(ModelAndView mv, HttpServletRequest request) {
		MemberVO user = memberService.getMemberByRequest(request);
		mv.addObject("user", user);
		mv.setViewName("/template/member/mypage");
		return mv;
	}
	
}