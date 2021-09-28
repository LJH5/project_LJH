package kr.green.matboda.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.green.matboda.pagination.Criteria;
import kr.green.matboda.pagination.PageMaker;
import kr.green.matboda.service.MemberService;
import kr.green.matboda.service.RestaurantService;
import kr.green.matboda.service.ReviewService;
import kr.green.matboda.vo.MemberVO;
import kr.green.matboda.vo.RestaurantVO;
import kr.green.matboda.vo.ReviewVO;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("/member")
public class MemberController {
	
	MemberService memberService;
	ReviewService reviewSevice;
	
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
	public ModelAndView memberSignoutGet(ModelAndView mv, HttpServletRequest request, HttpServletResponse response) {
		memberService.signout(request, response);
		mv.setViewName("redirect:/");
		return mv;
	}
	@GetMapping("/mypage")
	public ModelAndView memberMypageGet(ModelAndView mv, HttpServletRequest request, Criteria cri) {
		MemberVO user = memberService.getMemberByRequest(request);
		
		//리뷰 수
		int reNum = memberService.getReviewCountById(user, cri);
		
		//즐겨찾기 수
		int faNum = memberService.getFavoritesCountById(user, cri); 
		
		mv.addObject("user", user);
		mv.addObject("reNum", reNum);
		mv.addObject("faNum", faNum);
		mv.setViewName("/template/member/mypage");
		return mv;
	}
	@GetMapping("/modify")
	public ModelAndView memberModifyGet(ModelAndView mv, HttpServletRequest request) {
		MemberVO user = memberService.getMemberByRequest(request);
		mv.addObject("user", user);
		mv.setViewName("/template/member/modify");
		return mv;
	}
	@PostMapping("/modify")
	public ModelAndView memberModifyPost(ModelAndView mv, MemberVO user, HttpServletRequest request, MultipartFile file)throws Exception {
		MemberVO loginUser = memberService.getMemberByRequest(request);
		MemberVO uUser = memberService.updateMember(user, loginUser, file);
		if(loginUser != null)
			request.getSession().setAttribute("user", uUser);
		mv.setViewName("redirect:/member/mypage");
		return mv;
	}
	@GetMapping("/delete")
	public ModelAndView deleteGet(ModelAndView mv, HttpServletRequest request, HttpServletResponse response) {
		MemberVO user = memberService.getMemberByRequest(request);
		memberService.deleteMember(user);
		memberService.signout(request, response);
		mv.setViewName("redirect:/");
		return mv;
	}
	@GetMapping("/reviewList")
	public ModelAndView reviewListGet(ModelAndView mv, HttpServletRequest request, Criteria cri) {
		MemberVO user = memberService.getMemberByRequest(request);
		
		cri.setPerPageNum(5);
		ArrayList<ReviewVO> reviews = memberService.getReviewById(user, cri);
		int totalCount = memberService.getReviewCountById(user, cri);
		PageMaker pm = new PageMaker(totalCount, 5, cri);
		
		mv.addObject("title", "리뷰's");
		mv.addObject("user", user);
		mv.addObject("reviews", reviews);
		mv.addObject("pm", pm);
		mv.setViewName("/template/member/reviewList");
		return mv;
	}
	@GetMapping("favoritesList")
	public ModelAndView favoritesListGet(ModelAndView mv, HttpServletRequest request, Criteria cri) {
		MemberVO user = memberService.getMemberByRequest(request);
		ArrayList<RestaurantVO> list = memberService.getRestaurantByFavorites(user, cri);
		
		cri.setPerPageNum(9);
		int totalCount = memberService.getFavoritesCountById(user, cri);
		PageMaker pm = new PageMaker(totalCount, 5, cri);
		
		mv.addObject("title", "즐겨찾기's");
		mv.addObject("list", list);
		mv.addObject("pm", pm);
		mv.setViewName("/template/member/favoritesList");
		return mv;
	}
}	