package kr.green.matboda.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.green.matboda.service.MemberService;
import kr.green.matboda.service.ReviewService;
import kr.green.matboda.vo.MemberVO;
import kr.green.matboda.vo.ReviewVO;
import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
@RequestMapping("/review")
public class ReviewController {
	
	ReviewService reviewService;
	MemberService memberService;
	
	@GetMapping("/register")
	public ModelAndView registerGet(ModelAndView mv) {
		
		mv.addObject("title", "리뷰 등록");
		mv.setViewName("/template/review/register");
		return mv;
	}
//	@GetMapping("/register")
//	public ModelAndView registerPost(ModelAndView mv, ReviewVO review, HttpServletRequest request, MultipartFile [] fileList) {
//		MemberVO user = memberService.getMemberByRequest(request);
//		
//		mv.setViewName("redirect:/restaurant/main");
//		return mv;
//	}
}
