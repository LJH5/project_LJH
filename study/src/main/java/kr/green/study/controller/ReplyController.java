package kr.green.study.controller;

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

import com.mysql.cj.x.protobuf.MysqlxDatatypes.Array;

import kr.green.study.service.MemberService;
import kr.green.study.service.ReplyService;
import kr.green.study.vo.MemberVO;
import kr.green.study.vo.ReplyVO;
import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
@RequestMapping("/reply")
public class ReplyController {
	private ReplyService replyService;
	private MemberService memberService;
	
	@PostMapping("/add")
	public String addPost(@RequestBody ReplyVO reply, HttpServletRequest request) {
		//System.out.println(reply);
		//return reply.toString();
		MemberVO user = memberService.getMemberByRequest(request);
		return replyService.insertReply(reply, user);
	}
	@GetMapping("/list")
	public Map<Sring, object> listGet(){
		@PathVariable("page") int page, @PathVariable(rp_bd_num) int rp_bd_n
		HashMap<String, Object> map = new HashMap<Sring , Object()
		//System.out.println(page);
		//System.out.println(rp_bd_num);
		ArrayList<ReplyVO> list = replyService.getReplyList();
	}
}
