package kr.green.test.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import kr.green.test.pagination.Criteria;
import kr.green.test.pagination.PageMaker;
import kr.green.test.service.ReplyService;
import kr.green.test.vo.ReplyVO;
import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
public class ReplyController {

	private ReplyService replyService;

	@PostMapping("/reply/ins")
	public String replyInsGet(@RequestBody ReplyVO rvo) {
		return replyService.insertReply(rvo) == 0 ? "FAIL" : "OK";
	}
	@GetMapping("/reply/list/{rp_bd_num}/{page}")
	public Map<String, Object> replyListGet(@PathVariable("rp_bd_num") int rp_bd_num, @PathVariable("page") int page){
		//System.out.println(rp_bd_num);
		HashMap<String, Object> map = new HashMap<String, Object>();
		//System.out.println(page);
		Criteria cri = new Criteria(page, 3);
		//3은 한 페이지당 댓글 수
		int totalCount = replyService.getTotalCount(rp_bd_num);
		PageMaker pm = new PageMaker(rp_bd_num, 3, cri);
		//System.out.println(pm);
		ArrayList<ReplyVO> list = replyService.getReplyList(rp_bd_num, cri);
		//System.out.println(list); 
		map.put("replyList", list); //xml로 온다
		map.put("pm", pm);
		return map;
	}
	/* 기본 틀을 만들고 404 에러가 안 뜨는지 확인
	 * @PostMapping("/reply/mod")
	public String replyModPost() {
		return "";
	}
	*/
	@PostMapping("/reply/mod")
	public String replyModPost(@RequestBody ReplyVO reply) {
		//System.out.println(reply);
		return replyService.updateReply(reply);
	}
}