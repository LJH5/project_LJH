package kr.green.matboda.service;

import java.util.ArrayList;

import kr.green.matboda.pagination.Criteria;
import kr.green.matboda.vo.MemberVO;
import kr.green.matboda.vo.ReplyVO;

public interface ReplyService {

	String insertReply(ReplyVO reply, MemberVO user);

	ArrayList<ReplyVO> getReplyList(int rp_bo_num, Criteria cri);

	int getTotalCount(int rp_bo_num);

	String modifyReply(ReplyVO reply, MemberVO user);

}
