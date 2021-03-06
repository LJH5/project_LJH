package kr.green.study.service;

import org.springframework.stereotype.Service;

import kr.green.study.dao.BoardDAO;
import kr.green.study.dao.ReplyDAO;
import kr.green.study.vo.MemberVO;
import kr.green.study.vo.ReplyVO;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ReplyServiceImp implements ReplyService {
	
	private ReplyDAO replyDao;
	private BoardDAO boardDao;
	
	@Override
	public String insertReply(ReplyVO reply, MemberVO user) {
		if(reply == null || reply.getRp_bd_num() <= 0 || user == null)
			return "FAIL";
		BoardDAO board = boar
		if(board == null)
		reply.setRp_me_id(user.getId());
		replyDao.insertReply(reply);
		return "OK";
	}
}
