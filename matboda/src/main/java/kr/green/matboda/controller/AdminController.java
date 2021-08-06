package kr.green.matboda.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.green.matboda.service.MemberService;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class AdminController {
	
	MemberService memberService;
	
	@GetMapping("/admin/home")
	public ModelAndView home(ModelAndView mv) {
		
		
		
		mv.addObject("title", "관리자 메인");
		mv.setViewName("/template/admin/home");
		return mv;
	}
}
