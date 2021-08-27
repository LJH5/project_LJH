package kr.green.matboda.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.matboda.vo.ReviewVO;

public interface ReviewDAO {

	void insertReview(@Param("review")ReviewVO review);

	ArrayList<ReviewVO> selectReview(Integer num);

}
