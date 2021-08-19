package kr.green.matboda.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.matboda.pagination.Criteria;
import kr.green.matboda.vo.ReplyVO;

public interface ReplyDAO {

	void insertReply(ReplyVO reply);

	ArrayList<ReplyVO> selectReplyList(@Param("rp_bo_num")int rp_bo_num, @Param("cri")Criteria cri);

	int selectTotalCount(int rp_bo_num);

	ReplyVO selectReply(int rp_num);

	void updateReply(ReplyVO reply);
	
}
