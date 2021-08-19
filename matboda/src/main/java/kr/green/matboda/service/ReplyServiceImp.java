package kr.green.matboda.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import kr.green.matboda.dao.BoardDAO;
import kr.green.matboda.dao.ReplyDAO;
import kr.green.matboda.pagination.Criteria;
import kr.green.matboda.vo.BoardVO;
import kr.green.matboda.vo.MemberVO;
import kr.green.matboda.vo.ReplyVO;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ReplyServiceImp implements ReplyService {
	
	private ReplyDAO replyDao;
	private BoardDAO boardDao;
	
	@Override
	public String insertReply(ReplyVO reply, MemberVO user) {
		if(reply == null || reply.getRp_bo_num() <= 0 || user == null)
			return "FAIL";
		BoardVO board = boardDao.selectBoard(reply.getRp_bo_num());
		if(board == null)
			return "FAIL";
		reply.setRp_me_id(user.getMe_id());
		replyDao.insertReply(reply);
		return "OK";
	}

	@Override
	public ArrayList<ReplyVO> getReplyList(int rp_bo_num, Criteria cri) {
		return replyDao.selectReplyList(rp_bo_num, cri);
	}

	@Override
	public int getTotalCount(int rp_bo_num) {
		return replyDao.selectTotalCount(rp_bo_num);
	}

	@Override
	public String modifyReply(ReplyVO reply, MemberVO user) {
		if(reply == null || user == null)
			return "FAIL";
		ReplyVO dbReply = replyDao.selectReply(reply.getRp_num());
		if(dbReply == null || !dbReply.getRp_me_id().equals(user.getMe_id()))
			return "FAIL";
		replyDao.updateReply(reply);
		return "OK";
	}

	@Override
	public String deleteReply(Integer rp_num, MemberVO user) {
		if(user == null || rp_num <= 0)
			return "FAIL";
		ReplyVO dbReply = replyDao.selectReply(rp_num);
		if(dbReply == null || !dbReply.getRp_me_id().equals(user.getMe_id()))
			return "FAIL";
		replyDao.deleteReply(rp_num);
		return "OK";
	}
}
