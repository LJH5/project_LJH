package kr.green.matboda.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.green.matboda.service.MemberService;
import kr.green.matboda.vo.MemberVO;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("/admin/*")
public class AdminController {
	
	MemberService memberService;
	
	@GetMapping("/user/list")
	public ModelAndView userListGet(ModelAndView mv, HttpServletRequest request) {
		MemberVO user = memberService.getMemberByRequest(request);
		ArrayList<MemberVO> list = memberService.getMemberList(user);
		
		mv.addObject("list", list);
		mv.setViewName("/template/admin/user/list");
		return mv;
	}
}
