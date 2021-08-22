package kr.green.matboda.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.matboda.pagination.Criteria;
import kr.green.matboda.vo.ReviewVO;

public interface ReviewDAO {

	void insertReview(ReviewVO review);

	ArrayList<ReviewVO> selectReviewList(@Param("rp_bo_num")int rp_bo_num, @Param("cri")Criteria cri);

	int selectTotalCount(int rp_bo_num);

	ReviewVO selectReview(int rp_num);

	void updateReview(ReviewVO review);

	void deleteReview(Integer rp_num);
	
}
