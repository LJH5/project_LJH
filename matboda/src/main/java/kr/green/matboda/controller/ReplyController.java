package kr.green.matboda.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.green.matboda.pagination.Criteria;
import kr.green.matboda.pagination.PageMaker;
import kr.green.matboda.service.MemberService;
import kr.green.matboda.service.ReplyService;
import kr.green.matboda.vo.MemberVO;
import kr.green.matboda.vo.ReplyVO;
import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
@RequestMapping("/reply")
public class ReplyController {

	private ReplyService replyService;
	private MemberService memberService;

	@PostMapping("/add")
	public String addPost(@RequestBody ReplyVO reply, HttpServletRequest request) {
		MemberVO user = memberService.getMemberByRequest(request);
		return replyService.insertReply(reply, user);
	}
	
	@GetMapping("/list/{page}/{rp_bo_num}")
	public Map<String, Object> listGet(
		@PathVariable("page") int page, @PathVariable("rp_bo_num") int rp_bo_num){
		HashMap<String, Object> map = new HashMap<String, Object>();
		Criteria cri = new Criteria(page, 5);
		ArrayList<ReplyVO> list = replyService.getReplyList(rp_bo_num, cri);
		int totalCount = replyService.getTotalCount(rp_bo_num);
		map.put("list", list);
		map.put("pm", new PageMaker(totalCount, 5, cri));
		return map;
	}
	@PostMapping("/mod")
	public String modPost(@RequestBody ReplyVO reply, HttpServletRequest request) {
		MemberVO user = memberService.getMemberByRequest(request);
		return replyService.modifyReply(reply, user);
	}
}
